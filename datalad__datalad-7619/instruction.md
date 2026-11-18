# Issue

**Title:** test_gracefull_death: raise test_gracefull_death  threshold to 300 from 100

## Description

On the recent ones we had:

	datalad@smaug:/mnt/datasets/datalad/ci/logs/2024$ datalad foreach-dataset -s --o-s relpath bash -c "git grep FAIL.*test_graceful.*assert\ 100"
	01/25/pr/7551/8df6c0c/github-Test on macOS-4860-failed/0_test (brew).txt:2024-01-25T19:43:26.2831880Z FAILED ../tests/test_parallel.py::test_gracefull_death - assert 100 > 178
	01/25/pr/7551/8df6c0c/github-Test on macOS-4860-failed/test (brew)/8_Run tests.txt:2024-01-25T19:43:26.2831150Z FAILED ../tests/test_parallel.py::test_gracefull_death - assert 100 > 178
	02/13/push/maint/b8535c9/github-Test on macOS-4882-failed/1_test (snapshot).txt:2024-02-13T16:01:49.8189220Z FAILED ../tests/test_parallel.py::test_gracefull_death - assert 100 > 107
	02/13/push/maint/b8535c9/github-Test on macOS-4882-failed/test (snapshot)/8_Run tests.txt:2024-02-13T16:01:49.8189210Z FAILED ../tests/test_parallel.py::test_gracefull_death - assert 100 > 107
	06/03/pr/7575/78ce071/appveyor-9739-failed/vfb0o8gscoye5u02.txt:[00:13:52] FAILED ../datalad/support/tests/test_parallel.py::test_gracefull_death - assert 100 > 229
	06/06/pr/7575/4295dd0/appveyor-9750-failed/mm4b8hdqs9tik33x.txt:[00:14:35] FAILED ../datalad/support/tests/test_parallel.py::test_gracefull_death - assert 100 > 105
	06/16/pr/7616/2aecc96/appveyor-9763-failed/h877t5kly4jfdb7a.txt:[00:13:09] FAILED ../datalad/support/tests/test_parallel.py::test_gracefull_death - assert 100 > 104

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf6065ab646d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.