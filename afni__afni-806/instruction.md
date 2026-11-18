# Issue

**Title:** Asymm report

## Description

The asymm report computes volumes, surface areas and right-left asymmetry ratios of these metrics.

asymm_report.csh                                 \
      -input HCA_lr_v0.9.nii.gz                     \
      -right_range 1 21                             \
      -left_range 31 51                             \
      -isosurf_dir ./surfs     \
      -isosurf_base HCA  -make_isosurfs -reportfile HCA_asymm_report.txt
 
cat HCA_asymm_report.txt 
#index label right_vol left_vol r/l_asymm right_area left_area ra/la_asymm
01 I/II 60.6 100.1 0.605 131.0 174.6 0.750
02 III 915.2 988.6 0.926 758.4 744.6 1.019
03 IV 4098.4 3693.2 1.110 1973.2 1871.0 1.055
04 V 3753.5 6044.5 0.621 2043.7 2629.7 0.777
05 VI 11850.1 10475.0 1.131 3900.2 3680.1 1.060
06 VIIA-f/t 194.4 371.6 0.523 305.7 402.3 0.760
07 VIIB 7365.8 7315.9 1.007 3393.5 3438.3 0.987
08 VIIIA 6653.6 7174.0 0.927 2871.9 3038.8 0.945
09 VIIIB 5427.4 5975.6 0.908 2354.3 2540.1 0.927
10 IX 4331.0 4968.5 0.872 1762.1 1884.5 0.935
11 X 596.2 713.4 0.836 563.5 645.1 0.874
12 Cr_I 19665.8 18644.6 1.055 4832.2 4699.9 1.028
13 Cr_II 11263.4 11516.9 0.978 3950.2 4023.5 0.982
14 DN 667.4 548.1 1.218 845.5 787.8 1.073
15 EN 26.4 21.5 1.227 65.2 56.8 1.148
16 GN 14.4 15.4 0.935 44.9 47.1 0.953
17 FN 16.5 16.4 1.008 49.9 48.9 1.020
18 SCP 371.4 369.4 1.005 506.8 504.3 1.005
19 MCP 2672.1 2432.6 1.098 1414.9 1360.9 1.040
20 ICP 135.9 135.8 1.001 176.6 167.8 1.052
21 CWM 3805.9 3277.4 1.161 2493.8 2188.7 1.139

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cecf04a697fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.