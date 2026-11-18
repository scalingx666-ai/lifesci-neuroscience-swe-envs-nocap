# Issue

**Title:** fix(runtime): reset process-level /metrics.lastActivityAt to now on restore

## Description

.

## 问题
runtime 开机从磁盘 restore 会话时,进程级 liveness 锚 `this.lastActivityAt`(即 `/metrics.lastActivityAt`)被设成**被恢复会话的旧磁盘时间戳**。托管层用 `now - metrics.lastActivityAt` 判容器空闲 → 刚重启的容器算出巨大 idle → 立刻误杀 → start→秒杀→start 死亡螺旋。

## 根因(`packages/runtime/src/session-manager.ts`)
`createSession` restore 分支:`else this.lastActivityAt = entry.lastActivityAt` —— 把进程级锚冻结到旧会话时间。`metrics()` 输出的就是它。

## 修法(issue 的 minimal option)
restore 时:
- **保留** per-session 历史 `entry.lastActivityAt`(UI/history 正确,"这个会话上次活跃于")
- 进程级锚改为 `this.lastActivityAt = Math.max(this.lastActivityAt, Date.now())` —— 反映"本进程/容器刚启动、活着",多会话 restore 单调稳健。
- **不改契约**:`/metrics.lastActivityAt` 仍是同一 top-level string,只修 restore 路径语义(未采用 issue Option 2 的加字段方案,避免契约扩展)。

## 验证
- runtime `tsc -b` + **289 单测**(restore.test +1:旧磁盘会话 restore 后 metrics.lastActivityAt ≈ now,而 per-session createdAt/updatedAt 仍保留旧值)
- web 不受影响(它读 per-session `state.lastActivityTs`,非 `/metrics`)
- testbed M14(evict → lastActivityAt sticky 非 null)不受影响(evict 路径未动)

进 0.0.11。

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `323d36889253`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.