# Issue

**Title:** fix(personas): single-language reports + dedup/reconcile

## Description

.

## 问题
用中文工作时,agent 产出的总结/报告中英混杂:`LANGUAGE_DIRECTIVE`(#97)只覆盖正文,但 auditor 硬编码整段英文报告模板,writer/librarian 用英文章节名描述结构。模型正文写中文却保留英文脚手架 → 双语输出;还常有要点重复/自相矛盾。

## 改动(纯 prompt,personas.ts)
- **LANGUAGE_DIRECTIVE**:显式覆盖章节标题/标签/表头/示例文本;指令里的英文模板视为"仅形状",把所有标题翻译成用户语言;新增总结/报告的去重+调和规则(合并重叠、解决矛盾)。
- **auditor**:报告模板标注 SHAPE ONLY——标题/标签/状态词翻译成用户语言,示例行是格式演示。
- **writer**:报告章节顺序是序列提示,标题用用户语言;加合并/调和说明。
- **librarian**:Output-format 标签(Key Findings 等)标注为形状,用用户语言写。

## 验证
- runtime `tsc -b` + **286 测试全过**(session-manager 仍断言 `## Response language` header 存在)
- **真实网关端到端**:中文多 agent 调研任务,PI 交付报告**全中文、章节标题也中文**(`### 一、关键发现`/`证据强度`/`文献`),英文只出现在应有处(作者名/期刊名/术语glossing);无英文 header 泄漏,要点无重复

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1aeb47586e13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.