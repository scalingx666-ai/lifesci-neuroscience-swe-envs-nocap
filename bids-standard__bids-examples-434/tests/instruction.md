# Issue

**Title:** Fixup and enhance invocation of run_tests.sh

## Description

ATM it would complain that rc is not legit command due to all those spaces. Because no set -e used it just continues.

Also made it executable and adjusted shebang to be universaly working. There should be no need to invoke directly via bash -- shebang would do that

Script likely worked correctly anyways since there is explicit `exit $rc` so if `$rc` remained undefined and no failed validator runs, it was just `exit` - clean exit?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `711be5ba05e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.