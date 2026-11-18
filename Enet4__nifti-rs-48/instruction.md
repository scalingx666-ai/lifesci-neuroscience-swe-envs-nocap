# Issue

**Title:** Update alga + nalgebra version.

## Description

We found that `nalgebra` and `alga` can be updated.

- nalgebra 0.18
- alga 0.9
- one test is slightly different (less than 10e-13)
- change deprecated function `into_subview` into `index_axis_move`

 I have made test with these commands:
```
cargo build --release --features ndarray_volumes
cargo test --release --features ndarray_volumes
cargo build --release --features nalgebra_affine
cargo test --release --features nalgebra_affine
cargo build --release --features ndarray_volumes,nalgebra_affine
cargo test --release --features ndarray_volumes,nalgebra_affine
```

everything looks fine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d63ef597357`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.