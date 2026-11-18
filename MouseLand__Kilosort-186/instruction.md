# Issue

**Title:** KCoords is not passed through GUI

## Description

Hello,

I tried to use my custom channel map and to launch Kilosort2 pipeline execution via Gui. I was surprised to see that instead of 8 shanks, 8 channels each, that I defined via kcoords variable, I see 32 linear probe configuration after Kilosort2 finishes calculation.

This comes from the fact that in ksGui, kcoords are not loaded from the channel map. That would mean that when preprocessDataSub.m will use loadChanMap.m, kcoords from default 32-channel linear probe will be used.

I suggest to load kcoords on the level of ksGUI, if kcoords exists.

Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67a42a87b866`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.