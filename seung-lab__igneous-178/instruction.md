# Issue

**Title:** make mesh_dir behavior consistent across create_meshing_tasks and create_mesh_manifest_tasks

## Description

Currently, running the example code with default arguments `mesh_dir=None`
- `create_meshing_tasks` leads to the creation of `LAYER/mesh_mip_0_err_40` (ignoring the value of `vol.info['mesh']`)
- `create_mesh_manifest_tasks` on the other hand tries to read/write from `LAYER/{vol.info["mesh"]}` https://github.com/seung-lab/igneous/blob/5f9f18f7f84e547cbf6f15c9bcd5b959581d0bed/igneous/task_creation/mesh.py#L63 https://github.com/seung-lab/igneous/blob/5f9f18f7f84e547cbf6f15c9bcd5b959581d0bed/igneous/tasks/mesh/mesh.py#L576

This and some minor `README.md` improvements.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f9f18f7f84e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.