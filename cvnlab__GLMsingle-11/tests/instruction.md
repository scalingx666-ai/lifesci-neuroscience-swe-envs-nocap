# Issue

**Title:** debug sessionindicator in calcbadness.py

## Description

fixing two discrepancies between matlab and python implementation of sessionindicator that caused buggy behavior in the python version. 

(1) 
![image](https://user-images.githubusercontent.com/35503086/123694887-e3acaa00-d827-11eb-9832-1cefbbcf264d.png)

because python range extends to the second argument minus 1, the python sessions variable is going to be missing the final session index supplied by the user. fixed via change to line 67.

(2) 
![image](https://user-images.githubusercontent.com/35503086/123694968-fcb55b00-d827-11eb-9f48-d749e9db8ffa.png)

this error happens because type of sessionindicator is list, and python doesn’t perform nice logical indexing the way matlab does when evaluating equality between a list and an int e.g. sessionindicator == 1… this can be easily solved by modifying the line to read: wh = np.flatnonzero(np.array(sessionindicator) == sess))

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7190670d87fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.