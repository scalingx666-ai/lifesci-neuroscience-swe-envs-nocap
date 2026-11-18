# Issue

**Title:** Include reference to paper in cma.Strategy and cma.StrategyOnePlusLambda

## Description

The reference to the paper where the implementation of CMA is detailed apears in the [cma-es example](https://deap.readthedocs.org/en/master/examples/cmaes.html), but not in the class docstring. Thus, when looking at the [cma strategies api documentation](https://deap.readthedocs.org/en/master/api/algo.html#module-deap.cma), the relevant reference cannot be found.

I added the citation in the docstrings  of the cma strategy classes, so that this would fix #132.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4dc75208662`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.