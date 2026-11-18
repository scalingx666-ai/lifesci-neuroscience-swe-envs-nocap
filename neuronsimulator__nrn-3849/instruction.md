# Issue

**Title:** Use getc_hook so Mac wheels can use readline 8.3 with InterViews

## Description

GNU readline 8.x plus rl_event_hook plus InterViews run_til_stdin() swallows tty input: nrniv / nrngui with DISPLAY set ignore the keyboard. -nogui still works. That was the 9.0.1 → 9.0.2 Mac-wheel regression (#3847 pinned GHA Mac wheels back to 7.0).

The real fix is the HOC glue, not staying on readline 7. Always compile hoc.cpp with use_rl_getc_function (the existing libedit path): wait in run_til_stdin() then read(0), matching readline 8's rl_getc.

With that in place, restore the GHA Mac static readline pin to 8.3. Linux Docker and the Azure Mac 7.0 secure tarball are unchanged.

Commits
1. InterViews: always use readline getc_hook
2. Mac wheels: restore static readline 8.3

Local verification (system X11, isolated static readline 8.3):
• 8.3 + rl_event_hook: keyboard ignored
• 8.3 + getc_hook (this PR): print 1+2 → 3 for nrniv and nrngui

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afcd4b1b723c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.