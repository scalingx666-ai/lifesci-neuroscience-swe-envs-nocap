# Issue

**Title:** [fix] fix issue with py lib and Dockerfile

## Description

Fix three issues that prevented compilation of Docker image and access to interactive shell session in Docker container.

[fix] fix broken Python library import: Import of 'trackvis' from 'nibabel' in file 'miracl_sta_gen_tract_density.py' would break with the following error message: cannot import name 'trackvis' from 'nibabel'. Fix by using prefix 'nib' for 'trackvis' call like so: 'nib.trackvis'.

[fix] change entrypoint for Docker container: 'ENTRYPOINT ["/opt/miniconda/bin/miracl"]' in 'Dockerfile' would not allow for interactive shell access and result in error prompting for valid MIRACL arguments when running 'docker run -it mgoubran/miracl bash'. Fix by uncommenting entrypoint line in Dockerfile.

[fix] modify CircleCI test case for docker: After removing the '/opt/miniconda/bin/miracl' entrypoint for the docker container, the CircleCI test case needed to be modified to reflect the changes. The '-h' flag has been replaced with an 'echo' command.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efefc8b12477`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.