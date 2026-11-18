# Issue

**Title:** Improve NWB support

## Description

This PR does the following:
- Save `F_chan2` and `Fneu_chan2` to NWB (fixes ),
- Add planes fluorescence containers to NWB,
- Separate ROIs for each plane in NWB,
- Test round trip writing + reading NWB file.

Here are below some screenshots that show the structure differences of the resulting NWB file (left: before this PR, right: after this PR): 

![image](https://user-images.githubusercontent.com/6053592/173171931-f37ce071-b2f4-48bf-9306-6e9009258b3b.png) ![image](https://user-images.githubusercontent.com/6053592/173171828-dadea4fe-615e-49db-bfa6-ceb59d4dd71e.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34b1bfd265d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.