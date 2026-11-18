# Issue

**Title:** BF: Fix undefined names and dead format arguments found by static analysis

## Description

Nine defects found by static analysis (`ruff --select F821,F822,F507,F601`), each an undefined name, a no-op format argument, or a colliding dict key. None of these are currently caught by CI.

### `psychopy/tools/gltools.py`

- **`__all__` exported `mergeVerticies`**; the function is spelled `mergeVertices`. The typo was introduced alongside the function itself in #7002, so `from psychopy.tools.gltools import *` has raised `AttributeError` ever since.

- **`useMaterial(None)` and `clearMaterial()` referenced `defaultMaterial`**, a module constant removed in #7002 along with the other predefined material constants. Both raised `NameError`. This is reachable from documented usage — `useMaterial(None)` is the "disable materials when done" step in `loadMtlFile`'s own docstring example, and `loadMtlFile` returns the `SimpleMaterial` objects `useMaterial` is built for.

  Rather than restore the constant, I added a small `_setDefaultMaterial()` helper. The removed constant stored shininess as a scalar `GLfloat` and applied it through `glMaterialfv`, whose pyglet signature is `LP_c_float` and rejects a scalar with `ArgumentError` — so restoring it verbatim would have replaced the `NameError` with a different crash. The helper instead mirrors `BlinnPhongMaterial.end()` in `visual/stim3d.py`: identical default values, with `glMaterialf` for shininess.

- **`clearMaterial()` called `unbindTexture()`**, removed in #7530. Replaced with `bindTexture(None, 'GL_TEXTURE_2D', 0)` — the same substitution #7530 made for the identical call in `stim3d.py`.

### `psychopy/tools/systemtools.py`

- **`__all__` exported `isPsychopyInFocus`**, renamed to `isRegisteredApp` in the PID refactor without updating the list, so the star-import raised `AttributeError`. Both `__all__` lists now resolve fully.

### `psychopy/experiment/components/variable`

- **Two `%` operators applied to format strings containing no placeholders** (`':\n' % self.params`), leaving the string unchanged. In the second case `%` also binds tighter than the surrounding `+`, so it applied only to the trailing literal. Removed the no-op substitutions; generated experiment code is byte-identical.

### `psychopy/visual/progress.py`

- **`_directionAliases` listed both `0` and `False`** (and `1` and `True`) as keys. These hash equal, so the later entries were silently discarded when the dict was built.

  Worth noting this one was *not* a behavioural bug: both keys in each pair mapped to the same value, so lookups were always correct. The redundant entries are removed, and `False`/`True` still resolve through the `0`/`1` keys, as the `direction` docstring documents.

### Testing

`pytest psychopy/tests/test_tools/ psychopy/tests/test_visual/test_progress.py psychopy/tests/test_experiment/test_component_compile_python.py psychopy/tests/test_experiment/test_component_compile_js.py` — **85 passed**.

Also verified every name in the `gltools` and `systemtools` `__all__` lists now resolves.

`psychopy/tests/test_experiment/` as a whole has pre-existing failures and a segfault on this machine; I confirmed the results are byte-identical with and without this change, so they are unrelated.

The `gltools` material paths need a GL context and are not covered by the test suite — that part is argued from the code and history above rather than from test results, and is worth a maintainer's eye.

### Not included

Two things I found but deliberately left out of this PR:

1. `gltools.py:5254` calls `bindTexture(material.diffuseTexture, 0)`, which passes `0` as `target` rather than `unit` — the same wrong-argument-position bug #7530 fixed in `stim3d.py`. It isn't one of the rule families above, but it means `useMaterial`'s texture path is still broken.
2. `psychopy/hardware/triggerbox/parallel.py` has 8 `F821`s on this branch (undefined `sys`, `logging`, and `address`) that are already fixed on `dev`. They look like straightforward crashes and may be worth backporting separately.

### Follow-up

I'd like to follow this with a small CI job selecting exactly these four rule families, so the fixes can't silently regress. Happy to open that separately if you're interested — it would need the two items above resolved on `release` first.

---

### A quick note on Opus 5

> I'm writing this note by hand. 

You may notice that this PR has a different structure than previous ones, it is written by Claude Opus 5, while I used Opus 4.8 so far. While I vetted Opus 4.8 enough to take full responsibility for it's behavior, I'm still evaluating this new model that went out a few hours ago, so I prefer to disclose its usage for the subsequent PRs.

The content is fine though, bugs were found and fixed by [ruff](https://docs.astral.sh/ruff/), a battle-tested tool.

Happy to give my input if you need to change the guidelines on LLM use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `994523dd0917`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.