# Issue

**Title:** [ENH] Fix internet connection check for global accessibility

## Description

## Description  

**What is this PR**  
- [x] Bug fix  
- [ ] Addition of a new feature  
- [ ] Other  

**Why is this PR needed?**  
The internet check relied on Google, which is inaccessible in some regions. This PR adds fallback URLs for global accessibility.  

**What does this PR do?**  
Adds alternative URLs (`pypi.org`, `bing.com`, `gitee.com`, `perdu.com`) to ensure connectivity checks work everywhere.  

## References  

  

## How has this PR been tested?  
- Tested locally in environments with and without Google access.  
- Verified fallback URLs work as intended.  

## Is this a breaking change?  
No, it maintains backward compatibility.  

## Does this PR require an update to the documentation?  
No, functionality remains unchanged for users.  

## Checklist:  
- [x] The code has been tested locally  
- [ ] Tests have been added  
- [ ] Documentation updated if needed  
- [x] Code formatted with [[pre-commit](https://pre-commit.com/)](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a09a9c68daa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.