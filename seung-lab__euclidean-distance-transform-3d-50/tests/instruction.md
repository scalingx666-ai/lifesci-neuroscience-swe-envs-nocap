# Issue

**Title:** Moving iteration over 2nd axis under function submitted to a thread pool for 3d EDT speeds up execution time to up to 3x

## Description

Hello, 
I just noticed that in 3d EDT, code iterates over two axes and submits iteration over the 3rd axis to the thread pool. It seems like `squared_edt_1d_multi_seg` and `squared_edt_1d_parabolic_multi_seg` are quick, so thread pool overhead is very noticeable. I have quickly moved iteration over the second axis in the function submitted to the thread pool and updated cpp/test.cpp to iterative over a number of workers, and got the following results:

Before:
Took 4.584 sec. with nw=1
Took 3.602 sec. with nw=2
Took 3.066 sec. with nw=3
Took 2.972 sec. with nw=4
Took 2.946 sec. with nw=5
Took 2.739 sec. with nw=6
Took 2.499 sec. with nw=7
Took 2.351 sec. with nw=8
Took 2.264 sec. with nw=9
Took 2.133 sec. with nw=10
Took 2.043 sec. with nw=11
Took 2.161 sec. with nw=12
Took 2.169 sec. with nw=13
Took 2.040 sec. with nw=14
Took 1.968 sec. with nw=15
Took 1.935 sec. with nw=16

After:
3.915 sec. with nw=1
Took 2.126 sec. with nw=2
Took 1.425 sec. with nw=3
Took 1.127 sec. with nw=4
Took 0.971 sec. with nw=5
Took 0.840 sec. with nw=6
Took 0.755 sec. with nw=7
Took 0.691 sec. with nw=8
Took 0.679 sec. with nw=9
Took 0.684 sec. with nw=10
Took 0.667 sec. with nw=11
Took 0.655 sec. with nw=12
Took 0.667 sec. with nw=13
Took 0.637 sec. with nw=14
Took 0.638 sec. with nw=15
Took 0.608 sec. with nw=16

Which is 3x speed up for 512^3 image from the test. Scaling over a number of threads is better, and CPU utilization is better for a bigger number of threads. 

Also, I have noticed that the first run always takes more time (almost twice as much). At first, I thought that the issue was that memory allocation was done the first time, and then OS reused the same pages, but when making only one allocation at the beginning, issues seemed to persist. That's why I have added "warm up" before running the test. Let me know if you have any ideas why is that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `585bb61fa8dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.