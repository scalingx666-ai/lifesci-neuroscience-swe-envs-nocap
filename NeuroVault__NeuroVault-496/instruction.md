# Issue

**Title:** [WIP] Populating db issue85

## Description

**This PR must be coordinated with the one in Neurovault/neurovault_data**

Instructions from @jbwexler were:

Instructions:
1. ./manage.py download_fixtures
2. ./manage.py loaddata users1 statmaps1  (just "dumpdata" in this case)
3. ./manage.py collectmedia --noinput

arguments also be added to step 1 to download specific fixtures:
./manage.py download_fixtures users1 statmaps1
I've been using just a whole fixture (not users and statmaps separated).

So, there are some things to solve:
- 1 fixture or many of them (users, statmaps... separated)? Capability of downloading just some of them or everything together?
- This sample data (1 study, 1 MRI set and 1 NIDM)? We should add more for the default?
- Command based (optional for the user) or populate dumpdata by default when "docker-compose up"?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0e95cede9ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.