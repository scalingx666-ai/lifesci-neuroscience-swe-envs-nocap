# Issue

**Title:** Re-organize and optimize GitHub Actions workflow

## Description

### Simplify GitHub Actions workflow
    
The changes below have been implemented to improve consistency, facilitate reuse, and streamline future maintenance (e.g generalization to other operating system)

- Remove superfluous env. variable
- Sort `-D` options alphabetically
- Rely on "actions/checkout" to efficiently download Slicer sources
- Set based of `$QT_ROOT_DIR` env. variable. This remove the hard-coded arch
- Simplify handling of source and build directories using `-B` and `-S` CMake options
- Specify type of CMake variable (e.g `BOOL` and `PATH`)
- Keep NumPy enabled as it is used by SlicerDMRI modules.
- Avoid explicit use build tool by leveraging "cmake --build <build-dir> --config <config>"
- Since ninja automatically enables parallelism based on the number of available core, remove the use of `$(nproc)`

Along with the following optimizations
- cancel in-progress GitHub Actions workflow on repeated pushes
- do not trigger build workflow if `.md` files are modified

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed544535f329`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.