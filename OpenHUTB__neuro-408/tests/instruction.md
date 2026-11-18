# Issue

**Title:** 修复“页眉的内容不对，翻译不够精确，文本框插入的上下文不对”

## Description

![image](https://github.com/user-attachments/assets/7031472d-5a64-496f-8869-32b925bc26cc)

1. 把文本框的内容提前了，页眉当中显示的是当前内容章节的二级标题；

2. 把全文的“情节记忆”替换成了“情景记忆”（包括一处图片中的替换，并在专用名词列表中增加）

3. 文本框放在了第一次出现引用的位置。

修复 

@Lostin-Tianyi

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4357f898392d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.