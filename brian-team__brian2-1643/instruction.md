# Issue

**Title:** Eliminate Python Layer Calls in `Synapses` Codegen Templates for SpikeQueue Operations

## Description

##  Description

This PR removes indirect Python method calls for interacting with the spike queue during synaptic spike propagation and replaces them with **direct C++ access** via Cython, improving runtime performance.

### Problem

Previously, the `synapses_push_spikes.pyx` template (and related code objects) relied on Python methods like:

* `_owner.push_spikes()`
* `_owner._queue.peek()`
* `_owner._queue.advance()`

This created an inefficient call chain:

```
Cython → Python → C++ (via method call)
```


---

### This PR Introduces

A **C++-only access path** through PyCapsules and minimal C++ interfaces:

| Operation       | Old (Python method)    | New (Direct C++ via Cython) |
| --------------- | ---------------------- | --------------------------- |
| Push spikes     | `_owner.push_spikes()` | `cpp_queue->push(...)`      |
| Peek from queue | `_queue.peek()`        | `cpp_queue->peek()`         |
| Advance queue   | `_queue.advance()`     | `cpp_queue->advance()`      |

* The `CSpikeQueue*` pointer is passed via a `PyCapsule` into the Cython template.
* Only minimal C++ methods (`push`, `peek`, `advance`) are declared and used.
* NumPy or Python overhead is completely bypassed in the inner simulation loop.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7a39ec68018`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.