# Issue

**Title:** feat(tools): per-tool on/off toggles for skill_search + local KB tools

## Description

## 目标

在前端「工具」面板（原 MCP tab）里给三个用户可控的 Pi-native SystemTool 各加一个开关：

- `skill_search`
- `get_domain_knowledge_local`
- `search_papers_local`

开关关闭后，工具**完全从 agent 的 tool 列表中移除** —— agent 既看不到也无法调用（即便幻觉合成一次调用，Pi 也会拒绝未知工具名）。通信 / 编排 / trace 类基础工具（`send_message` / `ask_user` / `create_agent` / `record_trace` / trace-agent 四件套）**永远**不受此开关控制，避免破 §9 角色契约。

## 生效时机

Runtime **懒读一次**，进程内缓存至生命周期结束（与 `ensureMcpTools` 同套路）：

- ✅ **重启后端** → 所有会话立即用新值（进程死掉 → 缓存清零 → restore 走 ensureAgent → 按新 toggle 重建 tool 列表）
- ✅ **新建会话** → 首个 `ensureAgent` 触发首读，自动生效
- ❌ **已在跑的会话** → 不受影响（避免热重连的 tool-list mutation 破坏 Pi/Provider 一致性）

UI 明写：\"改动会立即写入磁盘，但只在「重启后端」或「新建会话」时生效于所有会话。\"

## 落盘

新文件：\`<dataRoot>/bp_template/tool_toggles.json\`

\`\`\`json
{
  \"skill_search\": true,
  \"get_domain_knowledge_local\": true,
  \"search_papers_local\": true
}
\`\`\`

- 缺失字段 / 非 boolean / 未知 key → 全部回退到 enabled（默认全开，零 breakage）
- 与 \`mcp_servers.json\` / \`providers.json\` 同风格：\`tmp\` + \`rename\` + \`0o600\`
- PUT 是 **partial merge**（写 \`{ skill_search: false }\` 不会清掉其它两个）
- 保留用户手工加入的未知顶层 key（forward-compat）

## 分层实现

### Runtime (\`packages/runtime\`)

- 🆕 \`src/tool-toggles.ts\` — 只依赖 fs 的 loader，与 backend-core **不互相引用**（避免包依赖倒置）
- ✏️ \`src/tools/system-tools.ts\` — \`allSystemTools(deps, toggles?)\` 与 \`systemToolsForRole(role, name, deps, toggles?)\` 追加可选 toggles 参数；过滤发生在 \`allSystemTools\` 内部构造 Map 时。\`AGENT_TOOL_CONFIG\` 保持声明式意图不变（"策略上谁**该**用什么" ⊥ "物理上工具是否存在"）
- ✏️ \`src/session-manager.ts\` — 新增 \`ensureToolToggles()\`，在 \`ensureAgent\` 里传给 \`systemToolsForRole\`；\`SessionManagerOptions.toolToggles\` 供测试注入
- ✏️ \`src/index.ts\` — 导出 \`ToolToggles\` / \`loadToolToggles\` / \`isToolEnabled\` / \`TOGGLEABLE_TOOL_NAMES\`

### Backend (\`packages/backend-core\`)

- ✏️ \`src/config.ts\` — 加 \`readToolToggles\` / \`writeToolToggles\` + 类型；PUT 时非 boolean 值被 writer 丢弃（保证磁盘文件永远只包含合法 boolean）
- ✏️ \`src/app.ts\` — \`GET /api/tool-toggles\` + \`PUT /api/tool-toggles\`

### Frontend (\`packages/web\`)

- ✏️ \`src/contracts/backend.ts\` — 加 \`ToolToggles\` 类型 + \`TOGGLEABLE_TOOL_NAMES\`
- ✏️ \`src/utils/api.ts\` — \`api.toolToggles.{get, update}\`
- 🆕 \`src/components/settings/BuiltinToolsSection.tsx\` — 三行开关面板，optimistic-flip UI（失败回滚）
- ✏️ \`src/components/settings/SettingsDialog.tsx\` — MCP tab 顶部内联新 section；tab 标题 \`MCP → 工具\` / \`Tools\`，图标 \`Plug → Wrench\`（tab id 保持 \`\"mcp\"\` 以保 URL 稳定）
- ✏️ \`src/i18n/messages/settings.ts\` — 中英各 ~10 条新 key

## 测试

**Runtime** \`src/__tests__/tool-toggles.test.ts\` (8 tests)
- 文件缺失 / 不可解析 / 顶层非对象 → \`null\`
- 三字段全 boolean → 完整解析
- partial patch → 未列字段留 \`undefined\` + \`isToolEnabled\` 默认 true
- 未知 key（typo 或 always-on 工具名）**静默丢弃**
- 非 boolean 值（\`\"off\"\` / \`1\` / \`null\`）→ 丢弃，回退默认 true

**Runtime** \`src/__tests__/tool-access.test.ts\` (+7 tests)
- 无 toggles → principal 拿到全套（回归 default-on）
- 单独禁 \`skill_search\` → principal & librarian 都不含，其它两个仍在
- 单独禁 \`get_domain_knowledge_local\` → 不影响其它两个
- 全禁 → 只剩 always-on（\`send_message\` / \`ask_user\` / \`create_agent\` / \`destroy_agent\` / \`record_trace\`）
- **trace agent 完全不受 toggles 影响**（graph tools 永远保留）
- \`null\` toggles ≡ 无 toggles

**Backend** \`test/tool-toggles.test.ts\` (7 tests)
- 空数据目录 → \`GET\` 返回 \`{}\`
- \`GET\` 读现有文件
- \`PUT\` 单字段合并不清空其它
- \`PUT\` 空 body → 归一化写空对象
- \`PUT\` 丢 unknown key + 非 boolean
- 保留未知顶层 key（forward-compat）
- 磁盘权限 \`0o600\`（与 providers.json 同 posture）

## 测试结果

- ✅ Runtime: 332/332 tests pass
- ✅ Backend-core: 164/164 tests pass（含 7 个新 route test）
- ✅ Web: 211/211 tests pass
- ✅ Web build: 通过（910KB gz 267KB，无新增 warning）
- ✅ 所有包 tsc --noEmit 通过

## 显式非目标（留给后续）

- **不做 per-role 开关**（\"auditor 关但 principal 开\"）—— UI 复杂度高、收益低；将来若需可扩为 \`{ perRole?: {...} }\`，向后兼容。
- **不做热重连**（不动已在跑 session 的 tool 列表）—— 需要 Pi tool-list mutation 推送给 provider，风险 > 收益。
- **不改 persona 提示词**：目前 \`get_domain_knowledge_local\` / \`search_papers_local\` 未在 persona 段落里介绍（仅依赖 tool description 自介），可能影响 agent 主动使用意愿；这是既有缺口，另开 PR 补 \`LOCAL_KB_SEARCH\` 共享片段。

## 变更行数

+934 / -18，14 files changed。

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c3049feea37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.