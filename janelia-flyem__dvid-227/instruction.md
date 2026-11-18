# Issue

**Title:** Don't crash on exit if no logger

## Description

Observed this when no log file is configured:
```
2017/07/27 15:48:59 Closing log file...
panic: runtime error: invalid memory address or nil pointer dereference
[signal 0xb code=0x1 addr=0x0 pc=0x97bd81]

goroutine 35 [running]:
panic(0xd0d460, 0xc82000e0f0)
        /usr/lib/golang/src/runtime/panic.go:481 +0x3e6
gopkg.in/natefinch/lumberjack%2ev2.(*Logger).Close(0x0, 0x0, 0x0)
        /home/dvid/go/src/gopkg.in/natefinch/lumberjack.v2/lumberjack.go:166 +0xc1
github.com/janelia-flyem/dvid/dvid.stdLogger.Shutdown(0x0)
        /home/dvid/go/src/github.com/janelia-flyem/dvid/dvid/log_local.go:71 +0x4b
github.com/janelia-flyem/dvid/dvid.Shutdown()
        /home/dvid/go/src/github.com/janelia-flyem/dvid/dvid/log.go:64 +0x1be
github.com/janelia-flyem/dvid/server.Shutdown()
        /home/dvid/go/src/github.com/janelia-flyem/dvid/server/server.go:281 +0xda
main.DoServe.func1(0xc820064ae0)
        /home/dvid/go/src/github.com/janelia-flyem/dvid/cmd/dvid/main.go:257 +0x49f
created by main.DoServe
        /home/dvid/go/src/github.com/janelia-flyem/dvid/cmd/dvid/main.go:261 +0x74
```

Seems like slog is not initialized so it should not be closed.  (N.B., I don't do much go, but this seems like the right idea and does fix the crash.  Not sure if slog also needs to be initialized to nil somewhere.)

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/227)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d847019bb28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.