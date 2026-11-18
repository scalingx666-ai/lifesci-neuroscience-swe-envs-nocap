# Issue

**Title:** Dipole GUI interactivity and visual enhancements (phase 2)

## Description

#### Reference issue (if any)

following the discussion in #14228

#### What does this implement/fix?

- hover anywhere in the row bolds that dipole's trace
- row widgets are now detached instead of hidden with a new `remove()` on the abstract 
- now calls the  _`AbstractMplCanvas.set_color`, as `Brain`, so spines/ticks/... match the `Brain`

Opus 5 wrote the tests and I iterated over it. Happy to hear suggestions for the next phases!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e54d79984675`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.