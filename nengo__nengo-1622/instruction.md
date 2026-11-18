# Issue

**Title:** Update links to examples in README.rst

## Description

**Motivation and context:**
The links in README.rst to the examples were broken links. I have replaced those links.

**How has this been tested?**
Clicking each of the modified links to see if they now point to the correct webpage.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [ ] I have added tests to cover my changes.
- [ ] I have run the test suite locally and all tests passed.

I have not ticked the last three boxes as I don't think this small change is big enough to warrant appearing in a changelog. Also, I have not changed any code, so I didn't add test cases or run the test suite.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `736d68daae5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.