# Issue

**Title:** UX: error surfaces guide users to the fix (P0)

## Description

## 背景

这轮 UX 报错改进：很多报错只说"失败"却不告诉用户下一步该做什么（模型/MCP 没配好，应引导去设置）。扫描了 runtime / backend-core / web / cli 四层后，先做最高价值的 **P0 三项**。

三项互相独立，可分别 review。全部是增量兜底/引导，不改协议、不改正常成功路径，回归风险低。

## 改动

### 1. `fix(backend-core)`: 500 层 JSON 兜底
后端没有 `app.onError`，任何未捕获抛错被 Hono 默认成 text/plain `Internal Server Error`，前端 `handleJson` 解析崩（和已修的 #30 404 守卫同种病，搬到 500 层）。更糟的是把 orchestrator 精心写的诊断（runtime 起不来 / provider 配置错 / 缺 docker 依赖）全丢了。

- 加 `app.onError` 返回 `{error, code, hint}` JSON 500，`hint` 指向可执行的下一步。
- 测试：`ensureRuntime` 抛错时 `GET /api/sessions` 返回 JSON 500 含诊断 + hint。

### 2. `fix(web)`: `handleJson` content-type 守卫
200 但非 JSON（SPA index.html 兜底 / 该端点在此部署未实现）会让 `res.json()` 抛 `Unexpected token '<'`，对用户毫无意义。解析前检查 content-type，改抛可读消息。集中了原本 `getInfo`/`getEvents`/`getHistory` 各自散着的防御。

- 测试：200 + `text/html` 时抛友好错误而非 SyntaxError。

### 3. `feat(web)`: 无 provider 常驻 banner + 跳设置
首次使用没配 provider 时输入框照样能打字能发送，唯一信号是禁用下拉框上的 tooltip，发出去才撞错。加常驻提示条 +「去 设置 → Providers」按钮，深链直接切到 Providers 分区。

- `SettingsDialog` 加可选 `initialTab` prop（开时应用）。
- `DesktopShell` 加 `openSettings(tab?)` helper 透传目标 tab。
- `PromptComposer` 用 `providersLoaded` 标志避免首屏闪现；gating 抽成纯函数 `shouldShowNoProviderBanner()` + 单测。

## 验证

- 全 monorepo **674 测试通过**（含新增 6 个）
- root typecheck（protocol/skills/runtime/backend-core/cli/client-cli）干净
- web build（tsc + vite）通过

## 范围说明

本 PR 只做 P0。后续 P1/P2（401 密钥指引、MCP 连接失败上报、设置面板 MCP 健康测试、agent 创建错误进聊天、CLI 假成功探测等）留待下一轮。

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea71530f3803`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.