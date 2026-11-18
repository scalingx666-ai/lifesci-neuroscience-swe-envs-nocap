# Issue

**Title:** fix(demo): Live Demo 回放性能、缓存与健壮性修复

## Description

## 概述

对 Live Demo(会话回放播放器)做的一轮代码审查修复,覆盖 9 个发现,分正确性、性能、健壮性三类。两个 commit,全程测试驱动。

## 修复项

### 正确性
- **`useMemo` 副作用** — blob URL 的 revoke 从 `useMemo` 工厂移到 `useEffect` cleanup(键为 `decoded` map)。并发渲染下 memo 可能为被丢弃的渲染运行,原实现会 revoke 已提交渲染仍引用的 URL,导致图片/PDF 预览裂图。
- **缓存 stale unreadable** — 无 sandbox 打包时文件全标记 unreadable 并入缓存;之后即使起了 sandbox,重开仍命中旧缓存。bundle 现记录 `packedWithSandbox`,缓存条目无 sandbox 而当前有运行 sandbox 时跳过缓存重新打包。
- **预览误报 tooLarge** — trace 引用但未收集进 bundle 的 artifact 原会显示"文件过大";新增 `missing` 预览类型 + i18n 区分"包里没有"。

### 性能
- **回放 O(n²) → O(1)/tick** — 时间戳时间线原每 60ms tick 从头全量折叠所有 `≤cursor` 事件(O(events×frames),大会话掉帧)。抽出纯函数 `foldCache.ts` 做增量前缀折叠:前进只折新事件,后退时重建一次。
- **文件并发拉取** — 产出文件从串行改为有界并发池(6 路);总大小预算在拉取完成后按**路径顺序确定性**施加,保证同一会话总打包出相同 bundle。
- **节点真实时间对齐** — 节点原一律按数组序均匀铺开,与对话面板真实时间脱节。抽出纯函数 `computeNodeMs`(`nodeTimeline.ts`):时间戳可信(有限、数组序不减、跨真实区间)时用真实时间,否则回退均匀铺开;始终非递减(揭示切片的不变式)。

### 健壮性
- **`Math.min/max` 溢出** — 时间线 t0/t1 改为取已排序端点,避免大事件数 spread 进 `Math.min` 触发 RangeError。
- **打包取消** — `buildDemoBundle` 支持 `AbortSignal`(`PackAbortedError`);DemoView 在卸载、侧栏重点击/reset、import 时取消,避免慢打包 setState 到已卸载/过期视图。
- **base64 编码** — chunk 编码从 `String.fromCharCode(...subarray)` 改为显式逐字节循环,避免逼近参数个数上限。

## 测试

- 新增 3 个测试文件、**19 个用例**:`demoFoldCache`(6,折叠等价性/增量/后退/时间线切换)、`demoNodeTimeline`(9,时间信任规则/非递减不变式)、`demoBundleCollect`(4,api mock:并发/确定性预算/unreadable 分类/abort)。
- 全套 **199/199 通过**;`tsc -b` 与 `npm run build` 均通过。

## 影响面

纯前端(`packages/web`)。无 API/协议改动;`DemoBundle` 新增可选字段 `packedWithSandbox`,向后兼容旧 bundle。

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4e463d091d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.