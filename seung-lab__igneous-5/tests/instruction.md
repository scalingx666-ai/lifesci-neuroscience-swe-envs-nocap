# Issue

**Title:** feat: created LuminanceLevelsTask

## Description

Use this to sample the levels of a slice so that later we can apply contrast correction.

Writes JSON files to `levels/{z}` that contain the following attributes:
1. patch_size - The sampling area unit
2. coverage_ratio - How much of a given slice has been sampled?
3. num_patches - The number of samples
4. levels - Array of positive integers. Index = gray scale value, value = frequency count


Example:

```
{
"patch_size": [1024, 1024, 1], 
"coverage_ratio": 1.0, 
"num_patches": 1, 
"levels": [221, 44, 40, 40, 23, 23, 35, 24, 39, 41, 42, 28, 31, 44, 47, 36, 45, 37, 44, 48, 50, 43, 61, 53, 78, 75, 72, 75, 72, 79, 95, 99, 97, 88, 118, 110, 137, 137, 126, 156, 160, 176, 187, 199, 174, 228, 224, 235, 272, 290, 284, 340, 333, 343, 391, 402, 424, 484, 469, 499, 559, 595, 643, 672, 690, 715, 713, 771, 777, 905, 886, 927, 945, 936, 1047, 1005, 1032, 1084, 1079, 1199, 1185, 1222, 1261, 1252, 1275, 1252, 1322, 1312, 1422, 1422, 1398, 1369, 1352, 1383, 1453, 1497, 1517, 1526, 1508, 1482, 1537, 1583, 1548, 1541, 1597, 1589, 1649, 1703, 1708, 1710, 1788, 1811, 1745, 1882, 1979, 1976, 2012, 1968, 2101, 2068, 2141, 2407, 2350, 2472, 2498, 2525, 2651, 2722, 2764, 2872, 2967, 3179, 3207, 3285, 3302, 3505, 3600, 3660, 3851, 3921, 4008, 4269, 4181, 4333, 4479, 4549, 4603, 4781, 4823, 4974, 5161, 5137, 5267, 5187, 5315, 5385, 5420, 5415, 5603, 5461, 5583, 5687, 5715, 5665, 5746, 5739, 5781, 5854, 5673, 5768, 5760, 5988, 5882, 5906, 5996, 5957, 5864, 5951, 6114, 6108, 6141, 6064, 5954, 6177, 6326, 6288, 6331, 6515, 6387, 6563, 6702, 6665, 6703, 6786, 6977, 6975, 7126, 7349, 7334, 7503, 7639, 7660, 7965, 8075, 8041, 8565, 8507, 8465, 8735, 8937, 9031, 9109, 9317, 9532, 9708, 9941, 9889, 10022, 10424, 10359, 10613, 10538, 11034, 11380, 11573, 11599, 11805, 12008, 12186, 12694, 12997, 13079, 13592, 13911, 13918, 14206, 14623, 14627, 14698, 14516, 14490, 13827, 13378, 12801, 11933, 10789, 9641, 8461, 6953, 5389, 3846, 2502, 1397, 596, 220, 50]
}
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c90c01f2b76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.