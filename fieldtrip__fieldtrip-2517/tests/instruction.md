# Issue

**Title:** Use batch mode to avoid writing huge amount of logfiles

## Description

qsubfeval uses the `-r` option to execute the job-function. As mentioned in this thread (https://nl.mathworks.com/matlabcentral/answers/2121156-disable-matlabconnector-on-linux-cluster?s_tid=mlc_ans_email_view#answer_1568384) it is recommended to use the `-batch` option instead, so that the new Matlab version doesn't write enormous amounts of logfiles. I am not aware of people needing to run qsubfeval to run jobs interactively, but otherwise this PR needs to be changed such that it becomes an input option.

See also: https://nl.mathworks.com/help/matlab/matlab_env/commonly-used-startup-options.html

Run the specified statement non-interactively.
-batch "statement"  

Run the specified statement interactively.
-r "statement"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9009e0d718c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.