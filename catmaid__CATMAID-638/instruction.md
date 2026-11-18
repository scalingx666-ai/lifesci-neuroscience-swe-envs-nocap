# Issue

**Title:** Don't show tracing tools by default when opening second stack.

## Description

When opening a second stack, the tracing toolbox (toolbox_data) will show, although it shouldn't.

project.js:setEditable() will unhide the tracing toolbox whenever a (editable) stack is opened. setTool() will then hide the toolbox again, but only if the stack opened is the first one (see project.js:70).

I didn't look into this any further, @tomka since we already discussed this, could you please check if this is a valid fix?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `231a3bc51b94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.