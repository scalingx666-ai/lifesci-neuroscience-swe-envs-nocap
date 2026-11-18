# Issue

**Title:** Tag table improvements

## Description

Partially .

Fixes a couple of bugs relating to selecting skeletons which aren't in the constraint set, and the incorrect table footers. Also ensures that labels are inserted into the table in lexicographic order.

In my opinion, because you can't guarantee that you pull the same labels every time you refresh the table, it's best to go back to the first page (rather than a bunch of new labels appearing somewhere on an earlier page and having you miss them). Similarly, all rows get unchecked on refresh. Filters remain intact.

Datatables only stores the last ordering step, so if you sort (for example) by reverse name, and then skeleton count, on refresh it will keep the skeleton count sorting but the total order will change because it doesn't sort by the name first. I think we'd need to extend datatables to accomplish this, or intercept clicks on the headers - it would be a bit gross.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `920e620b818b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.