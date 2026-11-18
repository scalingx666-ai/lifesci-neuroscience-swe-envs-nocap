# Issue

**Title:** Update download_data.sh

## Description

1.修复了wget的目标目录变量未定义,导致数据集被下载到根目录的问题
2.修复了单个for循环存在两个done语句,导致脚本运行异常中断的问题

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea5dab0042ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.