# Issue

**Title:** fix(runtime): auditor 升级为开放式科学可靠性审查（防泄漏/指标/基线）

## Description

## 背景

pi agent 最终报告反复出现方法学/有效性缺陷却无人拦截：数据/标签泄漏、指标误用、基线/chance 混淆。根因在 persona 层——auditor 被硬限定为「只查捏造」，且 PI 送审触发不覆盖建模结果、送审包缺代码指针。详见 #269。

## 改动（仅 persona 提示词，方案 B）

**`packages/runtime/src/personas.ts`**
- **Auditor**：由「封闭捏造清单」升级为**双维度审查**。
  - 维度 1 — 证据↔claim（防捏造，保留原逻辑）。
  - 维度 2 — 科学可靠性（有效性缺陷），分组：(a) 数据/标签泄漏与污染（含分组泄漏、时间泄漏、预处理越过划分、测试集污染）、(b) 指标误用/评估错误、(c) 基线/chance 混淆、(d) 其它有效性检查——**非穷举**，明写 “not exhaustive / including but not limited to”，允许举一反三。
  - 新增判定词 `pass/concern/flaw` 与 `## Reliability checks` 报告表；风险等级纳入 `flaw→high、concern→medium`。
  - 保留只读、绝不重跑实验、逐条引证据（file:line）的纪律。
- **Principal**：新增第四类**强制送审触发** = 任何建模/统计结果（accuracy、AUC、F1、decoding accuracy、R²、train/test 或 CV、baseline/chance 对比）；送审包须附**流水线代码 + 数据划分逻辑指针**，否则 auditor 查不了泄漏。

**`packages/runtime/src/__tests__/personas.test.ts`**
- 新增断言覆盖新范围（leakage/baseline/metric/reliability/concern/flaw、开放范围措辞、PI 建模触发），保留全部既有不变量断言。

## 验证
- `personas.test.ts` + `session-manager.test.ts`：**43/43**。
- 整包 runtime：**316/316**，无回归。

## 说明
- 未加运行时强制（方案 B）。「auditor 有时未被调用」仍依赖模型遵循提示词；如后续需要硬约束，可在 `extensions/trace-reminder.ts` 增补一次性 followUp 提醒。

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98cad095ae7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.