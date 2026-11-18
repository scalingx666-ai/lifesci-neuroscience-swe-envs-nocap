# Issue

**Title:** feat(runtime): throttle concurrent provider calls + coalesce retry warnings

## Description

Addresses #167 (subset A + B; Retry-After / SDK retry knobs left to discussion).

## 问题
多 agent 任务里,多个专家的 delivery loop 独立并发 → 同时 N 个 provider 调用 → 自造 429;且每次重试都新弹一条 warning 气泡,限流窗口刷屏。

## 改动
**A. 每-session 并发限流器**
- FIFO 信号量限制每 session 同时在飞的 `agent.prompt()` 数(超出排队,不失败)。
- 默认 4,env `BP_MAX_CONCURRENT_AGENTS`(意图范围 ~2–6),0/负数关闭。
- 包住 delivery-loop prompt + principal 自身 turn;`finally` 释放;delete/evict 清理。

**B. 重试警告合并**
- `auto_retry_start` 的 system_message 带稳定 id(`retry-<agent>-<runId>`);web reducer 对已存在同 id 的消息**原地更新**而非追加 → 用户看到一条会跳动的「retrying (n/N)」而不是 N 条。
- 无稳定 id 的 system_message 仍照常追加(不影响其他警告)。

## 不在本 PR(留 #167 讨论)
honor провайдер `Retry-After` 头 + 暴露 SDK retry 旋钮 —— 需 SDK 支持/属独立议题。

## 验证
- 全量 `tsc -b`;**runtime 288 测试**(+2 并发上限:cap 生效 ≤2 / cap≤0 关闭时溢出)+ **web 169**(+2 合并:同 id 原地更新 / 无 id 追加)
- **真实网关端到端**:`BP_MAX_CONCURRENT_AGENTS=2` 起,发一个委派给 3 个专家并行的任务,40 次采样非-trace running agent **始终 ≤2**(第三个专家排队,槽位释放后才跑),证明限流真生效

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1aeb47586e13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.