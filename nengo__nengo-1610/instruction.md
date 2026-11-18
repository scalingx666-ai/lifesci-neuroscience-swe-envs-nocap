# Issue

**Title:** Correct docstring for oscillator's frequency

## Description

The units are in radians per second. To specify the frequency in Hz, this value must be multiplied by ``2*np.pi``. FYI, can also make it more accurate using equation 5.9 from [my thesis](https://uwspace.uwaterloo.ca/bitstream/handle/10012/14625/Voelker_Aaron.pdf) but this requires knowing `dt`.

**Motivation and context:**
Corrects documentation.

**How has this been tested?**
N/A

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.
- [N/A] I have updated the documentation accordingly.
- [N/A] I have included a changelog entry.
- [N/A] I have added tests to cover my changes.
- [N/A] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `414915af73c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.