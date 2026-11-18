# Issue

**Title:** rtQA fixes and one more thing

## Description

I've done some rtQA map fixes. 

Earlier it dropped SNR/CNR map to CNR map or image when you switched rtQA mode to Motion correction or Spikes. Now it shows last seen mode. For example: if you watched SNR and than switched to Spikes - there will be SNR image in the main window.

One more thing is - rtQA/iGLM/rtQA+iGLM disabling. In config you can turn off rtQA or iGLM OR roi visualization. And you will win some time, for example:
SVM
rtQAOff - 0.0752 s
iGLMOff - 0.1385 s
AllOff - 0.1888 s

TASK_PSC
rtQAOff - 0.0934 s
iGLMOff - 0.2258 s
AllOff - 0.3031 s

And some UI bugs, such as layout glitch, has been fixed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6f955cc79e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.