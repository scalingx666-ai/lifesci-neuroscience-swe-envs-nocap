# Issue

**Title:** Update BrainSuite atlas labels

## Description

This PR aims to add the missing BrainSuite volume atlas labels (particularly adding the `USC Brain` atlas) when we import the BrainSuite processed anatomy.

Currently, we get this in the command window when importing `USCBrain`:
```
BST> Warning: Labels missing in atlas: 696 697 698 699 1106 1107 1108 1109 1112 1113 1114 1115 1124 1125 1126 1127 1132 1133 1134 1135 1136 1137 1154 1155 1156 1157 1158 1159 1174 1175 1188 1189 1190 1191 1192 1193 1230 1231 1232 1233 1236 1237 1238 1239 1244 1245 1246 1247 1254 1255 1256 1257 1336 1337 1338 1339 1348 1349 1350 1351 1354 1355 1356 1357 1372 1373 1380 1381 1390 1391 1426 1427 1432 1433 1434 1435 1436 1437 1448 1449 1452 1453 1454 1455 1458 1459 1460 1461 1502 1503 1504 1505 2106 2107 2108 2109 2112 2113 2114 2115 2124 2125 2126 2127 2132 2133 2134 2135 2136 2137 2154 2155 2156 2157 2158 2159 2174 2175 2188 2189 2190 2191 2192 2193 2230 2231 2232 2233 2236 2237 2238 2239 2244 2245 2246 2247 2254 2255 2256 2257 2336 2337 2338 2339 2348 2349 2350 2351 2354 2355 2356 2357 2372 2373 2380 2381 2390 2391 2426 2427 2432 2433 2434 2435 2436 2437 2448 2449 2452 2453 2454 2455 2458 2459 2460 2461 2502 2503 2504 2505
```

Showing one e.g. below (for missing label `1189`):

Current:
<img width="500" height="360" alt="before" src="https://github.com/user-attachments/assets/7b49b573-09c8-4a7f-9dce-398ace21834c" />

After proposed change:
<img width="500" height="360" alt="after" src="https://github.com/user-attachments/assets/fa08f479-7846-4231-855f-94e752f97396" />

The list of labels can be found in locally installed `BrainSuite23a\svreg\<name of atlas>\brainsuite_labeldescription.xml`.

Verified these with @ajoshiusc. 

Sample BrainSuite processed data: [link](https://drive.google.com/drive/folders/1nsqfXoBKHbUvftJjznO1_V07Y4aI_W-k?usp=sharing) (updated with processed data for all three atlases)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c376d64ad2c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.