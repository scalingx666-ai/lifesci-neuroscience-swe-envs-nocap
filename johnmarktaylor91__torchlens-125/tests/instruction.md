# Issue

**Title:** fix(vis): enable loop detection in render script & fix ELK stack overflow

## Description

## Summary
- Enable loop detection in `render_large_graph.py` by removing `detect_loops=False` (defaults to `True`) and switching `vis_opt` to `"rolled"`
- Bump ELK Node.js `--stack-size` floor from 64MB to 128MB and multiplier from 16x to 48x (matching heap scaling) to fix "Maximum call stack size exceeded" on large graphs

## Test plan
- [ ] Run `python scripts/render_large_graph.py 1000` and verify rolled output is produced
- [ ] Verify ELK layout succeeds without falling back to sfdp

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54a7dc000da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.