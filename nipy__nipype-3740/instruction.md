# Issue

**Title:** [ENH]Dynamic ram estimator

## Description

This PR introduces a simple and extensible mechanism to estimate node RAM usage at runtime when executing workflows with MultiProcPlugin.

A new RamEstimator base class allows users (and interface authors) to attach a RAM estimator to a Node or MapNode via the node.ram_estimator attribute.
The estimator computes a per-node memory estimate before execution, based on selected input traits, and is fully user-configurable.

Estimators aggregate RAM contributions from:
* file-like inputs (based on image voxel counts)
* numeric inputs (scalars or lists)

A human-readable debug string describing the estimate is stored in _report/report.rst under the runtime section.

For MapNodes, the estimator is inherited by subnodes and evaluated on a representative iteration; the resulting value is interpreted as the per-task peak RAM requirement.

No changes to interface execution logic are required; this only affects scheduling/resource management.

This is intended as an opt-in, non-invasive improvement to resource-aware scheduling in multiprocess workflows.

The usage would be something like this:

```
class FlirtRamEstimator(RamEstimator):
            def __init__(self):
                super().__init__(
                    input_multipliers={
                        'in_file': 32,
                        'reference': 4,
                    },
                    overhead_gb=0.3,
                    min_gb=0.5,
                    max_gb=4.0
                )

from nipype.interfaces.fsl import FLIRT
from nipype.pipeline.engine import Node

flirt = Node(FLIRT(dof=6), name="flirt")
flirt.ram_estimator = FlirtRamEstimator()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23e003bffddf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.