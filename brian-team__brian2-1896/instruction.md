# Issue

**Title:** Store the Cython random number buffers by value in the random state (fixes restore after a buffer refill)

## Description

.

As discussed in #1893, the runtime device now owns the `rand()`/`randn()` buffers of the Cython target and stores their content, instead of the address of a buffer allocated (and freed) by the generated code. This removes the dangling pointer that made `restore(restore_random_state=True)` read freed memory, or free a block twice, when a buffer was refilled between `store()` and `restore()`.

### Changes

`brian2/devices/device.py`:
- New module constant `RANDOM_BUFFER_SIZE = 20000` (moved from `cython_generator.py`).
- `RuntimeDevice.rand_buffer` and `randn_buffer` are `np.zeros(RANDOM_BUFFER_SIZE, dtype=np.float64)` arrays instead of a size-1 `intp` array holding a pointer.
- `get_random_state` is unchanged apart from a comment: it now copies the numbers themselves.
- `set_random_state` copies into the existing arrays, since the generated code refers to their data. A state stored by an earlier version (size-1 array holding an address) is never dereferenced: if its index is non-zero, a warning is logged and the index is set to 0, so that the buffer is refilled from the restored numpy state; with index 0 the restore is exact and nothing is logged.

`brian2/codegen/generators/cython_generator.py` and `templates/common_group.pyx`:
- `_rand`/`_randn` refill the device's buffer in place with `memcpy` from a fresh `numpy.random.rand(n)`/`randn(n)` array, and no longer call `free()`, clear `OWNDATA` or store an address. The numbers drawn are the same as before (see below).
- I left the `free` cimport and the `PyArray_CLEARFLAGS` declaration in `common_group.pyx`. Brian's own code no longer uses them, but I did not want to remove names that user-provided Cython implementations might rely on; I can remove them if you prefer.

`brian2/tests/test_network.py` (runtime targets only, skipped for standalone like `test_restore_with_random_state`):
- `test_restore_random_state_after_buffer_refills[rand|randn]`: stores the state with 51 numbers left in the buffer, then makes three assignments of `RANDOM_BUFFER_SIZE - 51` values, each of which refills the buffer, restores, and checks that the three assignments are reproduced exactly. `seed()` empties the buffers first, so the test does not depend on the tests that ran before it.
- `test_restore_random_state_from_file_in_new_process[rand|randn]`: stores the state to a file, then restores it in a new Python process (same preferences, passed through `prefs.as_file`) and compares the next assignment.
- `test_restore_random_state_without_buffer_content` (codegen independent): a state in the old format with a non-zero `rand` index logs one warning and resets that index, while the `randn` buffer with index 0 is restored silently.

### Validation

Linux (WSL Ubuntu 24.04, kernel 6.18), gcc 13.3, Python 3.13.14, numpy 2.5.4, Cython 3.3.0, on master 9f803d0 with the extensions built from source (`setup.py build_ext --inplace`). Windows and macOS were not tested locally.

- With only the new tests applied to master (with `RANDOM_BUFFER_SIZE` written out as 20000, since master does not define it), all five runtime tests fail with Cython: the in-process tests report 51 mismatched elements out of 19949 (the numbers left in the buffer at `store()`, read back from freed memory), and the child process of the file tests is killed by a segmentation fault (return code -11). `test_restore_random_state_without_buffer_content` also fails, since master logs no warning. With this branch, the 11 selected runs (codegen independent, Cython, numpy) pass, with the default `float_dtype` and with `float_dtype=float32`.
- Full test suite (`brian2.test(["cython", "numpy"], test_codegen_independent=True, test_in_parallel=[...])`, long tests excluded): with this branch, 56 doctests, 436 codegen-independent, 305 Cython and 308 numpy tests pass; on master, 56, 435, 301 and 304 (the difference is the new tests). The only failure, `test_base.py::test_version`, occurs on both, because the tests ran from a source copy without `setuptools_scm`. In this run, `test_restore_with_random_state` passed on master: whether it crashes depends on the tests that ran before it in the same worker.
- Reproduction script from #1893 (number of `randn` draws before `store()`): master gives `identical=True` at 0, an abort (`double free or corruption`) at 19500 and `identical=False` at 19990; this branch gives `identical=True` at all three.
- Same seed, no store/restore: 50 000 `rand()`, 50 000 `randn()`, 500 steps of a noisy `NeuronGroup` (5e5 `xi` draws) and a 1000-neuron `PoissonGroup` give bit-identical values and spikes on master and on this branch.
- ruff 0.14.2 (the version in `.pre-commit-config.yaml`): `ruff format` leaves the three Python files unchanged and `ruff check` reports nothing on `device.py` and `cython_generator.py`.

### Compatibility and cost

- States written by master and restored by this branch: one warning per buffer with a non-zero index, then simulation continues with freshly drawn numbers (on master, restoring the same file in a new process crashes with a segmentation fault).
- States written by this branch and restored with `restore_random_state=True` by an earlier version: `ValueError: could not broadcast input array from shape (20000,) into shape (1,)`. Restores without `restore_random_state=True` do not read the random state (`Network.restore`), so they are not affected in either direction.
- Each stored state is about 320 kB larger (two buffers of 20 000 doubles), also for the numpy target, which does not use the buffers. `store()` in memory shows no measurable difference; `store(filename=...)` writes 323 kB instead of 3 kB and took 1.5 to 3.5 ms instead of 0.4 to 0.6 ms (per-process medians, 8 processes per version).
- Refill cost: a noisy `NeuronGroup` drawing 1e7 `randn` values per run (500 refills) took a median of 0.274 s per run with this branch against 0.272 s on master (+0.8 %; 10 processes per version in random order, pinned to one core, 9 runs each). Without pinning, the timings of both versions were bimodal (about 0.27 s or 0.37 s), so unpinned comparisons on this machine were not conclusive.
- An alternative with smaller states would be to store only the unused part `buffer[index:]`; I kept the simpler version, but can change it if the state size matters.

### Relation with #1745

#1745 replaces the buffers by a shared C++ generator and also removes the dangling pointer. As you wrote in #1893, this fix can go in first; the new tests could then serve as acceptance tests for #1745 (except the old-format one). On its head (62829a7), the `rand` tests pass and each `randn` test fails on one element, because `get_state` writes `stored_gauss` with 6 significant digits (details in #1893).

This should also remove the flaky heap corruption in `test_restore_with_random_state` seen in the Python 3.15 jobs of #1891.

I used an AI assistant (Claude Code) to write the fix and the tests, run the validation and draft this description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f803d0c8190`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.