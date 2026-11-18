# Issue

**Title:** ivoc: give HocCommand a single boolean status convention

## Description

`HocCommand::execute` returned opposite senses depending on which kind of callback it was holding.

The Python branch returned `hoccommand_exec`'s boolean, which is `r.is_valid()` (`nrnpython/nrnpy_p2h.cpp:354`), so 1 means success. The HOC branch returned `hoc_obj_run`, which forwards `hoc_oc`, which returns 1 from inside its catch (`oc/hoc.cpp:1348`), so 0 means success. Both landed in the same `err` and were returned unchanged. `exec_strret` had the same shape.

## The convention

**1 == success**, matching the provider interface rather than the HOC error code. Every int-returning member of `neuron::python::methods` is a boolean where 1 is success — `hoccommand_exec` and `hoccommand_exec_strret` both return `r.is_valid()`, `pysame` is a predicate — and the two callers that reach `hoccommand_exec` directly rather than through `HocCommand` already test it that way: `cvodeobj.cpp:511` and `linmod.cpp:66`, both `if (!...)`.

The cost is that `execute` no longer forwards `hoc_obj_run` transparently; the HOC branch inverts it. That seemed the better trade than having the wrapper disagree with the interface it wraps, but it is the real argument against this direction and worth saying out loud.

## Call sites

Three check the return. All three were correct before this change, because each only ever holds one kind of callback:

- `oclist.cpp:660` — `exec_strret`, Python-only (`label_pystract_`).
- `oclist.cpp:667` — `execute`, HOC-only (`label_action_`; the two members are set in mutually exclusive constructors at `:535` and `:557`).
- `spaceplt.cpp:753` — `execute`, HOC-only (the Python case returns earlier through `cmd_->pyobject()` and `func_call`).

The latter two are updated here. The rest discard the return. The methods-table entry points are untouched, so the direct callers are unaffected.

To be explicit: there is no pre-existing bug being fixed. The two conventions were structurally insulated, each path only ever seeing one kind of callback, which is why this never surfaced. What it removes is a trap for the next caller that holds both kinds — which is how it came up, while looking at making `extra_scatter_gather` accept a HOC function.

## Test

`test/unit_tests/oc/hoc_interpreter.cpp` covers both methods in both senses, across HOC and Python callbacks, with the string path also asserting the buffer is written on success and left alone on failure.

`clang-format` 12.0.1 clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67fb8c6e8eaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.