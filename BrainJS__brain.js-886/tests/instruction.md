# Issue

**Title:** fix error cannot find module.

## Description

fix #885 

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->


## Description
<!--- Describe your changes in detail -->
fix eror cannot find module.
that error because when bran.js set gpu.js as peer dependecies. its not installed in our path. but,in user

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->


## How Has This Been Tested?
i only change external rollup setting
- [x] test for nodejs script
- [x] test for browser

## Screenshots (if appropriate):
![image](https://user-images.githubusercontent.com/33781288/227822351-b9e319d8-4f44-4bd6-8023-e42858a710b4.png)
![image](https://user-images.githubusercontent.com/33781288/230702584-517a7f19-3bec-4eb5-9059-453a58e2496c.png)

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] My code focuses on the main motivation and avoids scope creep.

## Reviewer's Checklist:
- [x] I kept my comments to the author positive, specific, and productive.
- [x] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `812b27dd00f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.