# Issue

**Title:** [ci] Fix windows pytest fatal exception

## Description

> This is an effect of a change introduced with pytest 5.0.0. From the release notes:
>
> > \#5440: The faulthandler standard library module is now enabled by default to help users diagnose crashes in C modules.
> >
> > This functionality was provided by integrating the external pytest-faulthandler plugin into the core, so users should remove that plugin from their requirements if used.
> >
> > For more information see the docs: https://docs.pytest.org/en/stable/usage.html#fault-handler
>
> You can mute these errors as follows:
>
> ```py
> pytest -p no:faulthandler
> ```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `957061783052`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.