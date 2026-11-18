# Issue

**Title:** neuronapi: nrn_rangevar_handle_str, describe a range variable's data handle

## Description

NEURON's Python interface prints a reference such as `seg._ref_v` as its data handle, for example `data_handle<double>{Node::field::Voltage row=2/5 val=-65}`. That text names the storage the value lives in and its row there, which follows the node order. `test_optim_node_order` reads the row out of it, and the datahandle tests check the text of a POINTER reference. A C API caller has no way to get it.

`nrn_rangevar_handle_str(sym, sec, x, index, buf, size)` writes that text for element `index` of a range variable at `x`; for a POINTER, it describes the handle the pointer holds. It reuses `rangevar_handle` from `nrn_rangevar_push_nothrow` (#3905), so the checks are those of `nrn_rangevar_get_nothrow`. It returns the full length (truncating to `size - 1`), or -1 with the error message in `buf`.

Docs in `capi.rst` after `nrn_rangevar_push_nothrow`.

Test: `test/api/rangevar_handle_str.cpp` checks:
- the voltage text and its value;
- that the row equals `nrn_segment_node_index` for each segment;
- a mechanism variable (`cont=hh gnabar ...`);
- truncation with a short buffer;
- errors for an uninserted mechanism, an unset POINTER and a NULL section.

All of `test/api` passes, valgrind clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0f7a943088d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.