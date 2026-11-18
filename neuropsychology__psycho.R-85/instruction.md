# Issue

**Title:** #83

## Description

When the dataset was not attached, the following error was returned.

```r
data <- affective
#attach(affective)
fit <- lmer(Tolerating ~ Salary + Life_Satisfaction + Concealing + (1|Sex) + (1|Age), data=data)
best <- find_best_model(fit)
```
> Error in eval(inp, data, env) : object 'Tolerating' not found.

It was because of the function get_all_vars(). Hence my changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42da950bb7df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.