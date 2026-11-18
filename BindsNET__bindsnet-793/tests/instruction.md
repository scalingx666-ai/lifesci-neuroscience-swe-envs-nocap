# Issue

**Title:** Remove dead AbstractFeature.degrade hook

## Description

Supersedes #792. Thanks to @Anai-Guo for finding the bug.

## What is wrong

`AbstractFeature.degrade` calls itself, passing an argument the method does not accept:

```python
def degrade(self) -> None:
    return self.degrade(self.value)
```

`degrade` takes only `self`, so this raises `TypeError` on the very first call, for every feature. It is not even infinite recursion.

## Why removing rather than fixing

`git log -L 286,295:bindsnet/network/topology_features.py` returns a single commit, 4b577e9 "Add topology_features.py". The self-call has been there since the file was created, so the method has never run successfully once.

Nothing calls it. Grepping the whole repo across all file types, the only occurrences of `degrade` as a method are the definition and the broken self-call inside it. No caller in the library, examples, tests, or docs.

It looks like an intended third per-feature lifecycle hook alongside `update` and `normalize`, which `MulticompartmentConnection` does call generically over its feature pipeline (`for f in self.pipeline: f.update(**kwargs)` and `f.normalize()` in `topology.py`). The matching `for f in self.pipeline: f.degrade()` loop was never written. Degradation ended up in `Degradation.compute` instead, which is where the pipeline applies every feature, and which already guards against `degrade_function` being `None`.

Fixing the typo would leave two spellings of the same operation, the fixed `degrade()` being the unguarded one. It would also leave a method on the abstract base that only `Degradation` can satisfy, since `degrade_function` is set solely by `Degradation.__init__` — calling `degrade()` on a `Weight` or `Mask` would still fail, just with `AttributeError`.

## Risk

None that I can find. Any downstream caller would be crashing today.

## Verification

Full suite on this branch: 83 passed. `black --check` clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8c505aa66f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.