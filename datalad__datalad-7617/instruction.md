# Issue

**Title:** For appveyor ssh setup, setup MaxSessions 100 to avoid 'channel 22: open failed: connect failed: open failed'

## Description

ATM our logs are filled up (for appveyor only) with that message:

	datalad@smaug:/mnt/datasets/datalad/ci/logs/2024/06$ git grep -c 'channel 22: open failed: connect failed: open failed'
	03/pr/7575/78ce071/appveyor-9739-success/3vrfsttokn3sww1p.txt:495
	03/pr/7575/78ce071/appveyor-9739-success/v2jqxgatl4ktvapj.txt:495
	...
	06/push/master/4c7e73d/appveyor-9752-success/my9t8hofyi3wqtog.txt:495
	06/push/master/4c7e73d/appveyor-9752-success/wiurn8jerqjjj8eb.txt:495
	06/push/master/60b3a58/appveyor-9755-success/g6w8q0pa1cphp4yl.txt:495
	06/push/master/60b3a58/appveyor-9755-success/onnalbjghayrae2h.txt:495
	11/pr/7592/2783f73/appveyor-9757-failed/uxyukgl6ur9e3okn.txt:176
	11/pr/7592/2783f73/appveyor-9757-success/5ehg7v66rwydo09w.txt:495
	15/pr/7592/a221897/appveyor-9758-failed/ya8xa1wce2412jgw.txt:411
	15/pr/7592/a221897/appveyor-9758-success/46tfk9y4pjgu371t.txt:495

and the issue was old known

- 

and addressed for the docker based setups which use http://github.com/datalad-tester/docker-ssh-target e.g. via the tools/ci/prep-travis-forssh.sh .

Attention to the issue was brought while reviewing stalls in
-  where such messages were the last things seen.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf6065ab646d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.