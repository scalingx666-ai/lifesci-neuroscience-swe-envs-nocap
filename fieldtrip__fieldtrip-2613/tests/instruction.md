# Issue

**Title:** Warn about uncorrected two-sided testing for any alpha

## Description

`ft_statistics_montecarlo` warns that a two-sided test with `cfg.correcttail='no'` evaluates each tail at the full alpha, but only when `cfg.alpha==0.05` exactly. A user who sets alpha to 0.01 or 0.1 is in the same situation and gets no warning. This drops the alpha condition so the warning is issued whenever `cfg.tail==0` and `cfg.correcttail=='no'`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_012d2sJAD5EUp4GqAStqoBX7

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e14f7291090`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.