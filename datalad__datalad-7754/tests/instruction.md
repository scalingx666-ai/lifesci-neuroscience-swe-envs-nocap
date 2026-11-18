# Issue

**Title:** Add use of pytest-retry and mark test_download_ftp to be retried

## Description

We have daily tests failing once in a while and one of the prominent reasons is this test.  I think it should be addressed if we just retry, but I could be proven wrong and only the time would show.

E.g. here are fails in the recent month so far in Oct:

	(git)smaug:/mnt/datasets/datalad/ci/logs/2025/10[master]git
	$> git grep -l '_______ test_download_ftp ______________'
	01/cron/20251001T062752/4174fcf/github-Test-795-failed/13_test (3.9, true, not).txt
	01/cron/20251001T062752/4174fcf/github-Test-795-failed/8_test (3.9, 0, always, miniconda=py37_23.1.0-1 --python-match minor --batch git-annex=8.20210310 -....txt
	05/cron/20251005T062424/4174fcf/github-Test-799-failed/16_test (3.12, not, 10, [annex] stalldetection = 1KB_120s, miniconda --channel conda-forge --pyth....txt
	05/cron/20251005T062424/4174fcf/github-Test-799-failed/test (3.12, not, 10, [annex] stalldetection = 1KB_120s, miniconda --channel conda-forge --pyth.../18_Run tests.txt
	06/cron/20251006T062832/4174fcf/github-Test-800-failed/15_test (3.12, not, 10, [annex] stalldetection = 1KB_120s, miniconda --channel conda-forge --pyth....txt
	06/cron/20251006T062832/4174fcf/github-Test-800-failed/test (3.12, not, 10, [annex] stalldetection = 1KB_120s, miniconda --channel conda-forge --pyth.../18_Run tests.txt

and in Sep:

	(git)smaug:/mnt/datasets/datalad/ci/logs/2025/09[master]git
	$> git grep -l '_______ test_download_ftp ______________'
	08/pr/7745/9eefa03/github-Test-752-failed/2_test (3.9, 0, always, miniconda=py37_23.1.0-1 --python-match minor --batch git-annex=8.20210310 -....txt
	08/pr/7745/9eefa03/github-Test-752-failed/6_test (3.9, not, ru_RU.UTF-8).txt
	08/pr/7745/9eefa03/github-Test-752-failed/test (3.9, 0, always, miniconda=py37_23.1.0-1 --python-match minor --batch git-annex=8.20210310 -.../18_Run tests.txt
	08/pr/7745/9eefa03/github-Test-752-failed/test (3.9, not, ru_RU.UTF-8)/18_Run tests.txt
	08/pr/7746/f8ba2b4/appveyor-10013-failed/40bj2j89gl4anal4.txt
	08/pr/7746/f8ba2b4/appveyor-10013-failed/5b1e7ixhii4h9y4s.txt
	08/pr/7746/f8ba2b4/appveyor-10013-failed/i1o0hwyt1ub97kwg.txt
	08/pr/7746/f8ba2b4/appveyor-10013-failed/tc74nqv234gh9ph7.txt
	08/pr/7746/f8ba2b4/github-Test-754-failed/0_test (3.9, not, ru_RU.UTF-8).txt
	08/pr/7746/f8ba2b4/github-Test-754-failed/test (3.9, not, ru_RU.UTF-8)/18_Run tests.txt
	08/push/dependabot%2fgithub_actions%2fmaint%2factions%2fgithub-script-8/f8ba2b4/github-Test-753-failed/3_test (3.9, 0, always, miniconda=py37_23.1.0-1 --python-match minor --batch git-annex=8.20210310 -....txt
	08/push/dependabot%2fgithub_actions%2fmaint%2factions%2fgithub-script-8/f8ba2b4/github-Test-753-failed/9_test (3.12, not, 10, [annex] stalldetection = 1KB_120s, miniconda --channel conda-forge --pyth....txt
	08/push/dependabot%2fgithub_actions%2fmaint%2factions%2fgithub-script-8/f8ba2b4/github-Test-753-failed/test (3.12, not, 10, [annex] stalldetection = 1KB_120s, miniconda --channel conda-forge --pyth.../18_Run tests.txt
	08/push/dependabot%2fgithub_actions%2fmaint%2factions%2fgithub-script-8/f8ba2b4/github-Test-753-failed/test (3.9, 0, always, miniconda=py37_23.1.0-1 --python-match minor --batch git-annex=8.20210310 -.../18_Run tests.txt
	25/pr/7749/b8c4a5f/appveyor-10017-failed/9uso13i3857nkh2h.txt
	26/push/maint/74da3a0/appveyor-10022-failed/57hs82cpv68h1l4h.txt

Here is ref to retry library and it seems to run tests even without it installed since it is based on marks: https://github.com/str0zzapreti/pytest-retry

I will also cut a release so just that we have a consistent state for testing -- some number of tune ups, primarily in tests, accumulated already.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4174fcfe527d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.