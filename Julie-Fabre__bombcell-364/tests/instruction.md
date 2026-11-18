# Issue

**Title:** Converting unit-level plotting methods in InteractiveUnitQualityGUI to static methods for greater portability

## Description

Generation of unit-level plots previously required instantiation of the InteractiveUnitQualityGUI class, because that's where all unit-level plotting methods reside. This pull request makes these methods static, enabling the generation of these plots without class instantiation.

Note: I have renamed the function "unit_quality_gui" to "load_unit_quality_gui" to avoid collisions with its parent module, which has the same name. Basically, since __init__.py originally included

```
from .unit_quality_gui import unit_quality_gui
```

This makes it impossible to later load the whole module using

```
import bombcell.unit_quality_gui as uqgui
```

Because now bombcell.unit_quality_gui refers to the function, not the module.

Renaming the function to "load_unit_quality_gui" eliminates this problem.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b25602537a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.