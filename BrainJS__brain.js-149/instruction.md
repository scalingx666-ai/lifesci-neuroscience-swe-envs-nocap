# Issue

**Title:** Add common .npmignore to exclude development files

## Description

## Description

<!--- Describe your changes in detail -->

This pull request adds a `.npmignore` file to exclude files from being published that should be in Git but not in the installation.

## Motivation and Context

Currently build configurations, test files and IDE settings are included in the published version (when installing via `npm install brain.js`):

<img width="415" alt="screen shot 2018-02-03 at 10 44 03 am" src="https://user-images.githubusercontent.com/338316/35770421-c1615cdc-08cf-11e8-9d6c-d118fad6096b.png">

Usually this is not a big deal but when building in the browser, the `.babelrc` file is being read by Babel and complains about missing plugins even though the published version is already transpiled. This will also make the installation size a little smaller.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33479b0c68f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.