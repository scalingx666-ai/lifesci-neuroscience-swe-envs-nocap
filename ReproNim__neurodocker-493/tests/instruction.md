# Issue

**Title:** FIX: --version output in containers

## Description

Prior to this PR, the `--version` output from containers would include `dirty`, indicating uncommitted changes. This was because `/docs` was not copied into the docker images.

Before this commit, the version output looks like this:

```bash
$ docker run --rm repronim/neurodocker:0.9.1 --version
neurodocker version 0.9.1+0.gad2f3a6.dirty
```

And after this commit, the version is:

```
$ docker run --rm neurodocker --version                                                                                           
neurodocker version 0.9.1+8.gf7f2aaf
```

Note the lack of `.dirty` in the output.

By excluding `/docs` from the Docker images, we were modifying the state of the git repository, and `git status` was reporting uncommitted changes. This caused the command `neurodocker --version` to show that there were uncommitted changes (by including the `dirty` suffix in the version). We do not want users to be under the impression that the version includes uncommitted changes. Indeed, kaczmarj excluded `/docs` from the docker builds as a premature optimization... it turns out that they only consume 136 kb, which is negligible.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d4b4c07d9f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.