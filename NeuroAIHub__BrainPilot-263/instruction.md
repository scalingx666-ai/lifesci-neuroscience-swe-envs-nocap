# Issue

**Title:** feat(files): differentiate the three file tiers (attachments / workspace / data)

## Description

## 背景

对话附件、会话工作区、持久库(#257)本是三个不同概念,但此前**没有可见区分**:附件其实被写进 workspace 根,`/data` 持久库前端完全没有入口。本 PR 把三个层级端到端显式化。

## 三层差异

| 层级 | 存储位置 | 路径前缀 | UI | 上传入口 |
|---|---|---|---|---|
| **对话附件** | `workspaces/<sid>/.attachments/` | `/attachments` | 聊天区 chip(带"对话附件"标签+强调色) | composer 回形针 |
| **当前会话** | `workspaces/<sid>/` | `/workspace`(裸) | 文件面板顶层"当前会话" | agent 产物 |
| **持久库** | `data/<userId>/` | `/data` | 文件面板顶层"持久库" | 面板内独立上传按钮 |

## 改动

- **runtime**:新增 `/attachments` 路径前缀 → 隐藏子目录 `workspaces/<sid>/.attachments/`,与 `/workspace`、`/data` 一样各自边界守卫。workspace 根 listing **隐藏 `.attachments/`**,不污染 agent 文件树。`drainLocalUploads` 天然递归,草稿附件完整迁移进真实会话。路径带 `/attachments` 前缀往返。
- **web(composer)**:回形针改传 `/attachments/<name>`(不再传 workspace 根);chip 加"对话附件"标签+强调色;发送提示指向 `.attachments/`。
- **web(文件面板)**:文件树改为**两个带标签的顶层层级** —— "当前会话"(/workspace,FolderOpen)与"持久库"(/data,Database),各带一行说明。持久库层级有独立上传按钮(写入 /data 并刷新);附件不进面板(只在聊天区)。
- **i18n(中英)+ 样式**:层级标题、说明、附件 chip。

## 测试

- 仓库自带单测:runtime 附件 write/list/隐藏/穿越防护;全量 693 通过。
- e2e 实测:三层各自落到独立磁盘位置(`.attachments/` vs workspace 根 vs `data/<userId>/`),路径前缀正确往返,workspace listing 正确隐藏 `.attachments/`。

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03def8e2894a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.