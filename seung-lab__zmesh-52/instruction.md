# Issue

**Title:** perf: additional marching cubes speed

## Description

This PR introduces the `preserve_order` flag on `mesher.mesh(labels, preserve_order=False)`. This option allows the mesher to relax the ordering of vertices and faces so that the produced mesh is not necessarily bit-wise identical to older versions, but still deterministic and accurate. 

The new algorithm is significantly faster. The old algorithm will be used by default to avoid surprised.

Relaxes ordering constraint on how labels are processed.

Version 1.11.1

```
$ ./test_1_11_1 connectomics.ckl 
Time taken: 1232 ms
$ ./test_1_11_1 connectomics.ckl
Time taken: 1241 ms
$ ./test_1_11_1 connectomics.ckl
Time taken: 1250 ms
$ ./test_1_11_1 ws.ckl          
Time taken: 3442 ms
$ ./test_1_11_1 ws.ckl
Time taken: 3472 ms
$ ./test_1_11_1 ws.ckl
Time taken: 3483 ms
```
Version 1.12.0
```
$ ./test_1_12_0 connectomics.ckl 
Time taken: 1123 ms
$ ./test_1_12_0 connectomics.ckl
Time taken: 1135 ms
$ ./test_1_12_0 connectomics.ckl
Time taken: 1128 ms
$ ./test_1_12_0 ws.ckl          
Time taken: 3142 ms
$ ./test_1_12_0 ws.ckl
Time taken: 3128 ms
$ ./test_1_12_0 ws.ckl
Time taken: 3239 ms
```

This PR:
```
$ ./test_pr connectomics.ckl
Time taken: 1009 ms
$ ./test_pr connectomics.ckl
Time taken: 976 ms
$ ./test_pr connectomics.ckl
Time taken: 1007 ms
$ ./test_pr ws.ckl          
Time taken: 2877 ms
$ ./test_pr ws.ckl
Time taken: 2848 ms
$ ./test_pr ws.ckl
Time taken: 2916 ms
```
Using deque instead of vector:
```
$ ./test_pr     
Time taken: 883 ms
$ ./test_pr
Time taken: 870 ms
$ ./test_pr
Time taken: 873 ms
$ ./test_pr ws.ckl
Time taken: 2234 ms
$ ./test_pr ws.ckl
Time taken: 2279 ms
$ ./test_pr ws.ckl
Time taken: 2279 ms
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e353bd941fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.