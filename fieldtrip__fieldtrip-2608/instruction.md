# Issue

**Title:** Count ties when computing Monte Carlo p-values (>= instead of >)

## Description

.

`ft_statistics_montecarlo` and `clusterstat` compared the observed statistic with the randomization distribution using strict inequalities, so randomizations that reproduce the observed value exactly were not counted. With `cfg.numrandomization='all'` the identity permutation is such a tie and no `+1` is added on that path, so every p-value was short by `1/Nperm` and the most extreme observed statistic was reported as p = 0 (verified: 0.000000 vs the exact 1/1024). With integer-valued cluster statistics (`maxsize`) ties are common and were all excluded.

This changes `>`/`<` to `>=`/`<=` in the univariate, ordered-statistics and multivariate branches of `clusterstat.m` and in the uncorrected and max-statistic branches of `ft_statistics_montecarlo.m`, matching the standard definition of the permutation p-value (Maris & Oostenveld 2007; Phipson & Smyth 2010) and the existing `+1/(N+1)` convention.

Verification (Octave 8.4, `ft_statfun_depsamplesT`, 10 subjects, 1024 sign flips): before — `prob = 0.000000`; after — `prob = 0.000977 = 1/1024`. A weaker-effect case moves from 783/1024 to 784/1024 as expected. No change for continuous statistics with random subsets except in the (measure-zero) event of an exact tie.

Happy to add a `test_issueNNN1.m` reproducing the 1/1024 case if that is the preferred form.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_012d2sJAD5EUp4GqAStqoBX7

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e14f7291090`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.