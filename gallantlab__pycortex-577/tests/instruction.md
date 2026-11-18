# Issue

**Title:** Fix xdrlib import compatibility for Python 3.12+ and Blender

## Description

## Problem
The current xdrlib imports in the blender module fail when using Python 3.12+ due to xdrlib deprecation and different Python environments between the main process and Blender's built-in Python interpreter.

**Error encountered:**
```
AttributeError: module 'mda_xdrlib' has no attribute 'Packer'
ModuleNotFoundError: No module named 'mda_xdrlib'
```
## Root Cause
1. Python 3.13+ removes xdrlib, requiring mda_xdrlib as replacement
2. Blender uses its own Python interpreter which may not have mda_xdrlib installed
3. mda_xdrlib has different import structure (`mda_xdrlib.xdrlib.Packer` vs `xdrlib.Packer`)

## Solution
Added fallback import logic that:
1. First tries built-in `xdrlib`
2. Falls back to `mda_xdrlib.xdrlib` if built-in xdrlib unavailable

## Changes Made
- Modified `cortex/blender/__init__.py`: Added try/except import logic
- Modified `cortex/blender/blendlib.py`: Updated import to use fallback approach

## Testing
- [x] Tested with Python 3.12 + built-in xdrlib
- [x] Tested with Python 3.13: it seems like blender Python version still has xdrlib
- [x] Verified Blender integration works
- [x] Confirmed `cortex.segment.cut_surface()` completes successfully

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b82ddd5e2ffb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.