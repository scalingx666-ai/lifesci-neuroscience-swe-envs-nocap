# Issue

**Title:** Convert 2 files to Typescript

## Description

Converts the array-lookup-table and data-formater files to Typescript 

## Description
Besides notations and comments I made the following changes:

Used a class instead of a function for  'array-lookup-table'

countSpecial had 2 bugs and is not called from anywhere, since it is not 100% clear what it was meant to do so I deleted it.
Bugs: 
Checking if i is less than the array instead of the length of the array
Setting the startIndex of the next search to a boolean, this looks like an attempt at an optimization (start search from the last found item) but it is incorrect.

If anyone can say for sure what the method should do (return the number of special indexes that exist in the output parameter"?) I can re-write it.

added a failing branch to catch unexpected "values" values, once the callers are converted it can be removed.

## How Has This Been Tested?
Tests were broken before the change, I did run lint:typecheck and it seems ok.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6729e233a5e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.