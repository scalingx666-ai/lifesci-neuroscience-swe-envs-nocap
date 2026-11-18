# Issue

**Title:** ENH: Show rejection and flat thresholds in Report.add_epochs

## Description

#### Reference issue (if any)
.
#### What does this implement/fix?
What I've added :
a new “Rejection thresholds” table in `Report.add_epochs` that we can see just above the Drop log that appears only when epochs were actually rejected (`epochs._bad_dropped`) this is automatically added, with no additional parameters, just as @larsoner  suggested
The table shows:
one row per channel type with two columns that is - the reject value and the flat values in readable units, e.g. 350 µV instead of 0.00035 and also a custom rejection function shows as “custom function” and when no thresholds were used, no table is added.
I've combined the rejects and flats in the table and not as separate entries as @larsoner mentioned to make it easier to compare side by side but if necessary I can easily change the design to that instead!
Also, this picks up from #13617, which was closed and it adds a test, `test_add_epochs_reject_thresholds`, covering numbers with units, a custom function, and no thresholds.
#### Additional information
Disclosure:
Claude (Opus 5.5) drafted the first implementation and the tests, and I built on it, fixed style issues, ran the tests and the report locally, checked the output, and understand every line that was incorporated in the fix.
Here is the attached image of the output ran locally->
<img width="1456" height="820" alt="image" src="https://github.com/user-attachments/assets/7db9df6d-2517-44b0-9019-08391dc1a96e" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e275bbcaa231`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.