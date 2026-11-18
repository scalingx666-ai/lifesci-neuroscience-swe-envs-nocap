# Issue

**Title:** BF: use psutil, not os.getuid(), to get the real UID for open-file detection

## Description

get_files_open_for_writing() filtered psutil.process_iter() to processes owned by the current user by comparing os.getuid() against the 'uids' psutil reports for each process. os.getuid() goes through libc and is exactly what UID-virtualizing wrappers such as fakeroot intercept and fake (e.g. as 0), whereas psutil reads the UID straight from the kernel's process credentials (/proc/<pid>/status on Linux), which such wrappers cannot spoof. Under fakeroot the two UIDs disagreed, so the comparison threw away every process -- including our own -- and the function always silently returned {}, disabling open-file detection entirely (surfaced while testing the Debian package build under
`fakeroot debian/rules binary`).

Add datalad.support.openfiles.get_real_uid(), which resolves the UID via psutil when available (falling back to os.getuid() otherwise), and use it in get_files_open_for_writing() and in the analogous os.getuid() == 0 root-check in the test_rotree test helper, which suffered the same inconsistency.

datalad.support.openfiles now also logs a warning at import time when psutil is missing, since open-file detection cannot work without it.

### PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet (add the `CHANGELOG-missing` label to this pull request in order to have a snippet generated from its title;
  or use `scriv create` locally and include the generated file in the pull request, see [scriv](https://scriv.readthedocs.io/)).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `409404917eb5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.