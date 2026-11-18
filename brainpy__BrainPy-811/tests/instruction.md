# Issue

**Title:** Fix Windows CI: Use python -m pytest instead of pytest command

## Description

Windows runners fail with "pytest is not recognized" error because pip-installed scripts may not be immediately available in PowerShell PATH.

## Changes

- **`.github/workflows/CI-models.yml`**: Changed `pytest tests/` to `python -m pytest tests/` in Windows job
- **`.github/workflows/CI.yml`**: Changed `pytest brainpy/` to `python -m pytest brainpy/` in Windows job

Linux and macOS jobs unchanged - direct `pytest` invocation works correctly there.

```diff
- pytest tests/
+ python -m pytest tests/
```

Using `python -m pytest` invokes pytest as a module, bypassing PATH resolution issues on Windows.

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>[BUG] The windows runner raised an error when running "Continuous Integration with Models" ci</issue_title>
> <issue_description>The windows runner raised an error when running "Continuous Integration with Models" ci.
>
> ```bash
> pytest: D:\a\_temp\2971078e-df66-4e10-9ecc-310312453275.ps1:2
> Line |
>    2 |  pytest tests/
>      |  ~~~~~~
>      | The term 'pytest' is not recognized as a name of a cmdlet, function, script file, or executable program. Check
>      | the spelling of the name, or if a path was included, verify that the path is correct and try again.
> Error: Process completed with exit code 1.
> ```</issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes brainpy/BrainPy#810

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc487d1213e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.