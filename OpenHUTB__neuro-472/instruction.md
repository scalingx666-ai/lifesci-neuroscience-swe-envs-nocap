# Issue

**Title:** 修复fitz安装失败的问题

## Description

其实只有切分pdf需要fitz包，而生成在线文档不需要

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9fe2428b4a44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.