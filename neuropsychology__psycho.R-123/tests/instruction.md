# Issue

**Title:** Replace defunct dplyr and ggplot2 functions

## Description

Package examples and tests fail with `mutate_()` defunct errors. The issue stems from using deprecated dplyr/ggplot2 functions that were removed in recent versions.

## Changes

- **crawford.test.R**: `aes_string()` → `aes()` for plot aesthetics
- **psychobject.R**: `select_if()` → `select(where())` for column selection
- **miscellaneous.R**: `summarise_all()` → `summarise(across(everything()))` for summarization

## Example

```r
# Before
ggplot(aes_string(x = "x", ymin = 0, ymax = "y"))
nums <- dplyr::select_if(summary, is.numeric)
error_mean <- error %>% summarise_all(mean)

# After
ggplot(aes(x = x, ymin = 0, ymax = y))
nums <- dplyr::select(summary, where(is.numeric))
error_mean <- error %>% summarise(across(everything(), mean))
```

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59b55723a74d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.