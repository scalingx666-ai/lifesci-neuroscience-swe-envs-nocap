# Issue

**Title:** [MRG] Better handling of traces

## Description

Finally  and #437 properly!

Traces-opening logic is now (as per docstring)

> The `.kwik` and `.kwx` must be in the same folder with the same basename.
>
> The files containing the traces (`.raw.kwd` or `.dat` / `.bin`) are determined according to the following logic:
> - Is there a path specified to a file which exists in [KWIK]/recordings/[X]/raw? If so, open it.
> - If this file does not exist, does a file exist with the same name in the current directory? If so, open it.
> - If such a file does not exist, or no filename is specified in the [KWIK], then is there a `raw.kwd` with the experiment basename in the current directory? If so, open it.
> - If not, return with a warning.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `630a2f11bb73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.