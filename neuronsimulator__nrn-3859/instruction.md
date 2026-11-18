# Issue

**Title:** oc: dispatch object components through per-template provider hooks

## Description

**This does not add a Python dependency to a Python-disabled NEURON.** That is the obvious first concern, so taking it head on:

- `nrnpy.h` is included unconditionally by `hoc_oop.cpp` and pulls in no Python headers. It forward-declares `PyObject` as `struct _object` with a comment saying it does that specifically to avoid needing them.
- Neither entry point takes a Python type: `py2n_component` is `(Object*, Symbol*, int, int)` and `hpoasgn` is `(Object*, int)`.
- The guard condition tests `nrnpy_pyobj_sym_`, which is defined unconditionally in `hoc_oop.cpp` and stays null until a provider registers.

So the gated region already compiles and links with no access to Python headers or libraries, and in a Python-disabled build no object can match the test, which means the branch is unreachable whether the `#if` is present or not.

## The problem

`py2n_component` (`hoc_oop.cpp:1023`) and `hpoasgn` (`:1479`) sit inside `#if USE_PYTHON`, defined only when `NRN_ENABLE_PYTHON` is on. A host that supplies its own provider through `neuron::python::methods` can fill the table correctly and still never be called, because the call site is not in the binary. Execution falls through to ordinary member lookup and reports `'x' not a public member of 'PythonObject'`.

## The change

Remove the guard at those two sites only. The other `USE_PYTHON` blocks in this file (the assignment-to-`OBJECTTMP` path) are a separate concern and are untouched.

## Test

`test/api/runtime_pythonobject_marshaling.cpp` supplies a minimal provider **without linking Python** and asserts exact component-read value 42.5, exact assigned value 73.25, the `answer` member name, callback counts, and consumed stack frames.

On an `NRN_ENABLE_PYTHON=OFF` build: the full `api::` suite passes (16/16) and `ldd libnrniv.so` shows no Python or libnrnpython dependency.

The test is also checked for non-vacuity: restoring the guard and rebuilding makes the same test binary abort with the original `'answer' not a public member of 'PythonObject'` error, so it genuinely detects the condition rather than passing regardless.

`git diff --check` clean; pinned clang-format 12.0.1 / cmake-format 0.6.13 produce no changes.

Happy to be talked out of this if there is something im not seeing here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd4f3287089a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.