# Issue

**Title:** feat(runtime): agent-accessible cross-session persistent root

## Description

## 背景

上传的文件只落在**每会话** `workspaces/<sid>/`,别的会话看不到,用户想复用的数据(数据集、参考文档)必须每会话重传。本 PR 引入一个**工作区外、每用户持久的跨会话根**,agent 文件工具和文件路由都能直接寻址。。

## 改动

- **布局**:`<dataRoot>/data/<userId>/`,与 `workspaces/` 平级。userId 来自 `BP_USER_ID`(默认 `local`,清洗为单一安全路径段)。整个 dataRoot 已是持久化卷,**无需新挂载**;托管层每用户设 `BP_USER_ID`(它们本就按容器/dataRoot 隔离用户)。
- **穿越防护**:`resolveManagedPath` 现按前缀解析**两个根** —— `/workspace[/...]`(或裸相对路径,行为不变)→ 会话工作区;`/data[/...]` → 持久根。各自边界内独立守卫,谁也逃不出自己的根、够不到对方。所有文件路由(list/read/raw/delete/write)都走它;`/data` 写入会把带 `/data` 前缀的路径回传以便往返。
- **agent 寻址**:Pi 原生文件工具不受 cwd 沙箱限制,因此把持久根的**绝对路径注入到 persona**(非 trace 角色,加载时),agent 用 `read`/`write`/`bash` 直接读写。
- **上传到 `/data`** 即写入共享根 → "一次上传,跨会话复用"。base64/既有上传契约不变(裸路径仍写工作区),#60 暂存 drain 与既有行为完好。
- **文档**:protocol 文件路由注释 + docker-compose 注释说明 `/data` 约定。文件面板分区展示留作可选跟进(issue 亦标 optional)。

## 测试

- 仓库自带单测(归 CI):跨会话可见性(A 写、B 读)、每会话隔离、两个根各自独立的穿越防护、自定义 `BP_USER_ID` 布局、userId 解析/清洗器 —— manager 层与 HTTP 路由层都覆盖。全量 build/typecheck + 683 测试通过。
- testbed 黑盒(本地 mock,零 token):contract / web-journeys(含既有上传契约 BPCASE-0017/0028)全过,向后兼容。端到端实测:session A 上传 `/data` → session B 读到同一字节;workspace 上传对 B 返 404(会话隔离);落盘布局 `data/<userId>/`;`/data/..` 逃逸被拒;`BP_USER_ID=alice` → `data/alice/`。

## 契约影响

`?path=` 新增 `/data` 前缀寻址持久根 + 新 env `BP_USER_ID`。既有裸路径/`/workspace` 语义不变,加法式 → minor。已同步 `RUNTIME_ROUTES` / protocol 注释 + docker-compose。

> 说明:与 #256(PR #258)基于同一文件链路,但两者分支均从 `main` 独立切出、无耦合;可独立评审合并。

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12ad88554082`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.