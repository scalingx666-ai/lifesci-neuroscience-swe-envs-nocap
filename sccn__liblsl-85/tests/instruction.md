# Issue

**Title:** Fixing flag to properly enable/disable loguru

## Description

Hello,

Using python bindings I noticed that I could not properly set a custom handler for SIGINT due to LSL's Loguru catching all signals (e.g. "Loguru caught a signal: SIGINT"), bypassing any other handler. Part of the problem lies I think in how C/C++ code sometimes takes precedence over python during execution when it comes to signals; since there is a thread always executing some LSL code in the background once an inlet is created, I cannot gracefully exit my program when users hit Ctrl-C (among other use cases).

Anyway, I wanted to disable Loguru, and... I could not do it. It appears that the flag `LOGURU_DEBUG_LOGGING` used in `common.cpp` to init Loguru is always set. Indeed, in `loguru.hpp` there is this piece of code:

```
#ifndef LOGURU_DEBUG_LOGGING
	#ifndef NDEBUG
		#define LOGURU_DEBUG_LOGGING 1
	#else
		#define LOGURU_DEBUG_LOGGING 0
	#endif
#endif
```

Simple three letters fix: test if `LOGURU_DEBUG_LOGGING` is set to 1 rather than just defined. Now Loguru can be properly enabled or disabled, e.g. by setting `LSL_DEBUGLOG` to either 1 or 0 during compilation. Ok not *entirely* disabled (at least some logs appears from `api_config.cpp`), but enough to avoid catching signals.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3de8daba510d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.