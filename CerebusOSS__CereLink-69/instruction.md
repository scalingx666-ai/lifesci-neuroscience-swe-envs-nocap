# Issue

**Title:** On Mac, default con.szInIP should be 255.255.255.255

## Description

As per [kb article](http://support.blackrockmicro.com/KB/View/168747-using-cbmex-on-osx), the szInIp field should be 255.255.255.255 on MacOS. With this change, ./testcbsdk now works.

An alternative to the change here is to wrap the [cbNET_UDP_ADDR_BCAST #define in cbhwlib.h](https://github.com/dashesy/CereLink/blob/master/cbhwlib/cbhwlib.h#L202) in an `#ifdef __APPLE__` `#else` `#endif`. I guessed that putting the conditional in the .cpp was preferred because that's where it already was for WIN32.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55cbfa448008`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.