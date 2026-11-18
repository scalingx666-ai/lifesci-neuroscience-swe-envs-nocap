# Issue

**Title:** [FIX]SoftFileLock inheritance across fork()

## Description

## Summary

Fix compatibility with `filelock >= 3.19.0` when using the `MultiProc` plugin with the `fork` multiprocessing context.

Starting with `filelock` 3.19.0, `SoftFileLock` instances inherited across a `fork()` raise a `RuntimeError`:

```text
RuntimeError: SoftFileLock on ... was inherited across fork; construct a new instance
```

`ConcurrentRotatingFileHandler` creates its `SoftFileLock` during initialization, so when a `ConcurrentRotatingFileHandler` instance is inherited by child processes created via `fork`, the same `SoftFileLock` instance is reused and the first call to `acquire()` fails.

This can be reproduced when running a workflow with the `MultiProc` plugin configured to use the `fork` multiprocessing context:

```python
wf.run(
    plugin="MultiProc",
    plugin_args={
        "n_procs": 2,
        "mp_context": "fork",
    },
)
```

## Changes

This patch stores the PID that created the `SoftFileLock` and recreates the lock lazily whenever the current process PID differs from the stored one. As a result, each process owns its own `SoftFileLock` instance while still synchronizing through the same `.lock` file.

This approach:

- restores compatibility with `filelock >= 3.19.0`;
- remains compatible with older `filelock` versions;
- does not rely on `filelock` private APIs;
- does not change behavior for applications that do not use `fork()`.

## Motivation

A `SoftFileLock` instance should not be shared across processes. While previous versions of `filelock` implicitly allowed this, recent releases correctly reject inherited lock instances. Recreating the lock after a fork aligns `ConcurrentRotatingFileHandler` with the expected `filelock` lifecycle while preserving the existing behavior.

## Reproducer

```python
from nipype import Node, Workflow
from nipype.interfaces.utility import Function


def worker(name):
    import time

    time.sleep(1)
    return name


n1 = Node(
    Function(
        input_names=["name"],
        output_names=["out"],
        function=worker,
    ),
    name="node1",
)
n1.inputs.name = "node1"

n2 = Node(
    Function(
        input_names=["name"],
        output_names=["out"],
        function=worker,
    ),
    name="node2",
)
n2.inputs.name = "node2"

wf = Workflow(name="fork_test")
wf.add_nodes([n1, n2])

wf.run(
    plugin="MultiProc",
    plugin_args={
        "n_procs": 2,
        "mp_context": "fork",
    },
)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b6660257441`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.