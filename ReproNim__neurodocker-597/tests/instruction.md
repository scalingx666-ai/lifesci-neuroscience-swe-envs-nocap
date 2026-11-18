# Issue

**Title:** Added "--add" command line option to add tar files as docker layers.

## Description

The --add option allows tar files to be added to docker containers without extracting inside the container or using intermediate layers.

For example if you have a rootfs in `.tar.gz` format named `hello.tar.gz` you can use the following command to add it.

```sh
neurodocker generate docker -b ubuntu -p apt --add ./hello.tar.gz /
```

This option is not currently supported with singularity.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f90b77f20502`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.