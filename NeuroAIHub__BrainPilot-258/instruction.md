# Issue

**Title:** feat(upload): raw streaming upload + configurable size cap

## Description

## 背景

Workspace 文件上传此前**只接受 base64 JSON 体**且**硬编码 20 MiB 上限**,阻断了托管/多租户部署所需的大文件上传(数据集、模型、媒体)。下载侧早已是原始二进制流(`GET /files/raw`),上传侧不对称。。

## 改动

- **runtime**:新增 `writeSessionFileStream` —— 把 `application/octet-stream` 请求体边收边写盘(不整块缓冲),流经时累计字节,一旦超限立即中止并删除半成品文件。`POST /sessions/:id/files` 按 `Content-Type` 协商:原始字节走 `?path=`(流式),或沿用既有 base64 JSON 体(保留)。
- **runtime**:上限可配置 —— `BP_UPLOAD_MAX_BYTES`(`resolveUploadMaxBytes`,默认 20 MiB);两条路径都强制执行。
- **backend-core**:原始 octet-stream 上传**字节级流式透传**到 runtime(缓冲式 `forward()` 用 `text()` 读体,会 UTF-8 解码损坏二进制)。`RuntimeClient` 以 `duplex:'half'` 转发 `ReadableStream` body。base64 JSON 仍走 `forward()`。
- **web**:`uploadFile` 对 ≥4 MiB 文件走原始 octet-stream(免 +33% base64 膨胀、免整块缓冲);更小文件保留 base64。
- **protocol**:文档化第二种(octet-stream)writeFile 请求形态。

**加法式**:base64 路径及其契约不变。

## 测试

- 仓库自带单测(归 CI):新增 raw 往返(二进制安全)、缺 `?path=`、路径穿越、两条路径的超限清理、backend 字节级透传等用例;全量 build/typecheck + 854 测试通过。
- testbed 黑盒(本地 mock,零 token):contract / web-journeys(含既有上传契约)/ crossplatform 等全过。端到端实测:30 MiB 文件在默认 20 MiB 上限被流式截断拒绝且清理半成品;`BP_UPLOAD_MAX_BYTES=100MiB` 后同一文件上传成功、md5 完全一致。

## 契约影响

在既有 `writeFile` 路由上新增一种可接受的 `Content-Type` + 一个 env 开关(`BP_UPLOAD_MAX_BYTES`),additive → minor。已同步更新 `RUNTIME_ROUTES` / protocol 注释。

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab23b84dda28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.