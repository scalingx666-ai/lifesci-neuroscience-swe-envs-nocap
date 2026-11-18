# Issue

**Title:** ENH: Add Docker build environment

## Description

## Summary

- Add a multi-stage `Dockerfile` (ubuntu:24.04 LTS) that installs all system dependencies and runs the full SuperBuild to produce a minimal runtime image containing BRAINSTools binaries.
- Add `.dockerignore` to exclude `.git`, build artifacts, and documentation from the Docker build context.
- Addresses #382.

## Usage

```bash
docker build -t brainstools .
docker run -it brainstools bash
```

Adjust the `NPROC` build arg for parallelism (default 4):
```bash
docker build --build-arg NPROC=$(nproc) -t brainstools .
```

## Notes

This is a starting point — the Dockerfile sets up the build environment but may need tuning for CI deployment workflows (e.g., caching SuperBuild external projects across builds, GPU support, or smaller base images).

## AI Disclosure

This PR was generated with assistance from Claude (Anthropic). The Dockerfile structure, package selection, and multi-stage layout were AI-drafted based on analysis of `CMakeLists.txt`, `Common.cmake`, and the `SuperBuild/` external project definitions. The author reviewed and is accountable for all content.

## Test plan

- [ ] `docker build -t brainstools .` completes without error
- [ ] `docker run brainstools BRAINSFit --help` produces usage output
- [ ] Runtime image size is reasonable (no build toolchain carried over)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33cb749126a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.