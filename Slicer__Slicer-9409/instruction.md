# Issue

**Title:** COMP: Fix macos build failure in curl when pipe2 erroneously found

## Description

When building on MacOS using Xcode 27 with `CMAKE_OSX_DEPLOYMENT_TARGET` < 27.0 (the default being 14.0 as written in https://slicer.readthedocs.io/en/latest/developer_guide/build_instructions/macos.html), I have a build issue in the curl project that looks like the following:

```
/SD/curl/lib/socketpair.c:55:6: error: 'pipe2' is only available on macOS 27.0 or newer [-Werror,-Wunguarded-availability-new]
   55 |   if(pipe2(socks, flags))
      |      ^~~~~
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX27.0.sdk/usr/include/sys/unistd.h:219:9: note: 'pipe2' has been marked as
      being introduced in macOS 27.0 here, but the deployment target is macOS 14.0.0
  219 | int     pipe2(int [2], int);
      |         ^
/SD/curl/lib/socketpair.c:55:6: note: enclose 'pipe2' in a __builtin_available check to silence this warning
   55 |   if(pipe2(socks, flags))
      |      ^~~~~
   56 |     return -1;
      |               
1 error generated.
make[5]: *** [lib/CMakeFiles/libcurl_static.dir/socketpair.c.o] Error 1
```

This is due to `pipe2` native support being introduced in MacOS 27.0. I can build successfully setting the deploy target to 27.0 as a workaround, but this change allows Xcode 27 to continue building for earlier targets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81adb1383c36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.