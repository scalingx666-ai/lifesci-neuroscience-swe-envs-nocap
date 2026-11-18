# Issue

**Title:** Add nrn_segment_node_index to the public C API

## Description

## What

Adds `int nrn_segment_node_index(Section* sec, double x)` to `neuronapi.h`.
It returns the index of segment `(sec, x)`'s node in NEURON's internal node
array, which is the value Python gives you from `seg.node_index()`.

## Why

Right now there's no way to get a segment's node index through
`neuronapi.h`, and there's no HOC symbol for it either (`node_index(0.5)`
just reports "undefined function"). So anything that binds the public
header but isn't the CPython extension, like the MATLAB interface, C++
code, or ctypes bindings, can't reach something the Python interface
already exposes.

## Implementation

It wraps `node_exact()` plus `Node::v_node_index`, the same pair the Python
extension uses in `nrnpy_nrn.cpp` (`node_index1`). A null or deleted section
returns `-1` instead of dereferencing:

```c
int nrn_segment_node_index(Section* const sec, const double x) {
    if (!sec || !sec->prop) {
        return -1;
    }
    return node_exact(sec, x)->v_node_index;
}
```

## Test

`test/api/node_index.cpp` (added to the `test/api` foreach list) builds a
`soma <- dend(nseg=3)` tree, calls `finitialize`, and checks a few things:
soma and dend land on distinct non-negative nodes, the call is stable when
you query it twice, the dend's three interior segments sit on three
different nodes, and a null section comes back `-1`. I also confirmed the
values match Python's `seg.node_index()` on the same topology.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9442b3b64d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.