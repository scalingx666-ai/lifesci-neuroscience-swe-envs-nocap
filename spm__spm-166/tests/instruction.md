# Issue

**Title:** Maintenance: build Linux MEX files inside a manylinux2014 container

## Description

## Summary

The Linux job of `compile_mex.yml` now runs `make -C src` inside a `manylinux2014` container (CentOS 7, glibc 2.17) instead of directly on the runner. MATLAB is still installed on the runner by `setup-matlab` and is bind-mounted into the container, so nothing else about the build changes. Because the host image no longer influences the result, the job's runner moves from `ubuntu-22.04` to `ubuntu-latest`. A new step reports the glibc and libstdc++ floor of the built MEX files in the job summary and fails the job if it exceeds what the container can produce.

## Why

The glibc floor of a MEX file is set by the host it is built on. `ubuntu-22.04` is the oldest runner GitHub offers, and its MEX files need `GLIBC_2.29` because glibc 2.29 re-versioned `exp`, `log` and `pow`, which 11 of the 51 sources in `src/` call. MathWorks' documented Linux minimum is glibc 2.28 with RHEL 8.6 still supported ([system requirements](https://www.mathworks.com/support/requirements/matlab-linux.html)), so the workflow's output could not load on RHEL, Rocky or Alma 8.

Measured by building a small C and C++ shared object in each image:

| Build host | glibc floor | libstdc++ floor |
|---|---|---|
| ubuntu-22.04 (gcc 11) | GLIBC_2.29 | GLIBCXX_3.4.21 |
| ubuntu-24.04 (gcc 13) | GLIBC_2.29 | GLIBCXX_3.4.32 |
| manylinux2014 (gcc 10, devtoolset) | GLIBC_2.2.5 | GLIBCXX_3.4.11 |
| committed `*.mexa64` files | GLIBC_2.14 | GLIBCXX_3.4.18 |

The `ubuntu-24.04` row matters because the `ubuntu-22.04` image starts deprecation on 17 September 2026 and is removed on 17 April 2027 (). On 24.04 the two C++ MEX files (`spm_mesh_dist`, `spm_mesh_geodesic`) would need `GLIBCXX_3.4.32`, which the libstdc++ bundled with MATLAB does not provide, so they would fail to load in most MATLAB releases. With the container the floor no longer depends on which runner GitHub still provides.

## Why `docker run` rather than a job-level `container:`

`setup-matlab@v1` installs its dependencies with apt and has to run on the Ubuntu host, and GitHub's Node runtime needs glibc 2.28 or newer, which rules out manylinux2014 as a job container. Running only the compile in the container, with MATLAB and the checkout mounted at their host paths, keeps the rest of the job as it was.

## Verification

Verified on [run 33616233368](https://github.com/spm/spm/actions/runs/33616233368) of this branch, with the host on `ubuntu-latest` (currently Ubuntu 24.04). The Linux job resolved the MATLAB root via `matlab -e`, built all 67 MEX targets inside the container with gcc 10.2.1 from its devtoolset, and the resulting files need `GLIBC_2.14` and `GLIBCXX_3.4.18`, the same floor as the committed `*.mexa64` files. The check step passed. An earlier run on an `ubuntu-22.04` host ([33615158620](https://github.com/spm/spm/actions/runs/33615158620)) produced the identical floor, which is the point: the host no longer matters. The macOS and Windows jobs are not touched by this change.

## Follow-up

- If `matlab_release` for Linux is ever raised to R2024a or newer, MATLAB itself needs glibc 2.28 and the container should become `manylinux_2_28`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e20e07c95bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.