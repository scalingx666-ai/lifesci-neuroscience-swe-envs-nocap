# Issue

**Title:** add template for niftyreg

## Description

@pwighton - it will probably be better to add niftyreg to the refactored version of neurodocker. the spec is a little different from the current neurodocker. i made the changes here. you can try it out with this command

```bash
docker run --rm kaczmarj/neurodocker:niftyreg generate docker \
  --pkg-manager apt \
  --base-image debian:buster-slim \
  --niftyreg version=master
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f7eb85e4352`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.