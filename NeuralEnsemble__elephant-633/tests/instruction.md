# Issue

**Title:** [ENH] add caching action for elephant-data

## Description

This PR adds a GitHub Actions runner for caching data from the Gin Elephant data repository and enabling local data usage for validation tests with the `elephant.datasets` module. 
This reduces the time required for data retrieval from gin, overall reducing the runtime of the GitHub Actions runners.

**GitHub Actions Runner**: Added a new GitHub Actions runner to cache data from the Gin Elephant data repository. Caching action is configured to execute as a cron job on a daily basis. This automated process ensures that data caches remains up-to-date.

**Local Data Usage for Validation Tests**: The `elephant.datasets` module has been modified to use local data for validation tests.  Additionally validation tests across various modules have been adapted to accommodate the option of using either local data or retrieving data from the Gin Elephant repository.
The path to local data can be provided by setting the environment variable `ELEPHANT_DATA_LOCATION`.

**Changes to CI**
Current CI runners have been adapted to retrieve the cached elephant-data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0984e19769b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.