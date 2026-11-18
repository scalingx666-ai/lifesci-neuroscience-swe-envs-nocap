# Issue

**Title:** Support PyTorch Lightning: more carefully avoid problematic attribute accesses

## Description

This PR makes a small change that allows *TorchLens* to work on [PyTorch Lightning](https://lightning.ai/docs/pytorch/stable/) modules.  If you're not familiar, *Lightning* is a framework that tries to abstract-away a lot of the training loop code that you'd otherwise have to write.  The problem arises because when a *Lightning* module is used outside the context of a *Lightning* training loop, it turns out that attempting to access one particular attribute of the module results in an exception being raised.  *TorchLens* ends up triggering this error (in three different places) as it attempts to monkeypatch the module.

This PR attempts to solve the problem by simply skipping any "inaccessible" attributes that are encountered.  Some minor comments about the implementation/tests:

- Since I found three instances of this attribute access pattern in the code, I factored the skipping logic into its own function.
- While trying to run the test suite, I found that it had a lot of dependencies that weren't included in any of the requirements files.  It also had some dependencies that I couldn't figure out how to install (specifically StyleTSS and Stable Diffusion).  I added the dependencies I could figure out to `requirements.test.txt`, and I changed the way the others are imported so that the affected tests xfail but the rest of the test suite still runs.
- On this topic, I think that `pyproject.toml` is a better way to specify extra dependencies than `requirements.*.txt`.  The main advantage is that it's more standardized, so it's easier for third-party tools to interact with.  If you want, I'd be happy to make a PR that transitions the project from `setup.py` to `pyproject.toml`.  While I'm at it, I could also make it so that GitHub automatically runs the test suite on each PR.
- In my hands, the `test_varying_loop_noparam2` test fails both in the main branch and in this branch.  I'm assuming that this is not related to the changes I made.
- I'm submitting this PR even though the test suite is still running (it takes a long time).  So far all of the tests but the one mentioned above have passed, and I'm pretty confident that my code works, but I'll comment if any more failures happen as the suite keeps running.
- I didn't run `black` because it looked like it would change a lot of code I didn't write.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4da3e31f02de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.