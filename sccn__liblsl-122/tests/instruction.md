# Issue

**Title:** Force max_buflen * srate to be at least 1

## Description

(this is a dup of #121, rebased on master after some CI fixes)

Very low rate streams combined with smallish max_buflen will give a queue size that gets truncated to 0. The result was a stream that kept disconnecting (at least that's what the log said). Here we + 1 to round up.

For situations where 0 < (nominal_srate() * max_buflen) % 1 < 0.5 , this PR actually gives you a queue length that's longer and less accurate (by 1) than before the change. For the rest of the situations, this is now more accurate. In sum, this is arguably better because it errs on the more conservative side (larger queue).

I started off using std::max(1, {old result}), which is closest to preserving old behaviour and just catching this error case, but it's probably a bit heavy to `#include<algorithm>` for such a simple fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a64ea75df841`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.