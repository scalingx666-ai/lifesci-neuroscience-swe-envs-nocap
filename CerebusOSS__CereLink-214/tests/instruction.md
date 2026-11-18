# Issue

**Title:** Fix Windows peer clock consensus and Central coexistence

## Description

. Addresses the CereLink side of #210.

## Changes

**Peer clock consensus on Windows.** The peer config reader was a stub on Windows, so an NSP never borrowed a HUB's clock offset and the NSP/HUB median vote never happened. It's replaced by `cbshm::NativeConfigReader` (`cbshm/native_peer.h`):
- a cross-platform, read-only mapping of a peer's NATIVE config segment;
- shares `isProcessAlive()` with `ShmemSession::isOwnerAlive()`;
- rejects segments written with a different config layout;
- consensus drops a peer's mapping once its owner exits, so a restarted peer is picked up again (POSIX previously stuck to the dead segment forever).

**Central instrument slots are per version.** CereLink hardcoded 7.8's slots (NSP = 3). That overran Central 7.7's three slots, so every Gemini NSP attach on 7.7 was rejected. The table now comes from `CentralDlg.cpp` at each release tag:

| Central | HUB1 | HUB2 | HUB3 | NSP |
|---|---|---|---|---|
| 7.0 | – | – | – | – |
| 7.5 | 1 | – | – | 0 |
| 7.6 / 7.7 | 0 | 1 | – | 2 |
| 7.8 | 0 | 1 | 2 | 3 |

A legacy NSP is slot 0 on every version.

**No STANDALONE fall-through while Central owns the device.** If `Central.exe` is running and has a slot for the device, a failed CENTRAL attach (or an undetectable Central version) is now an error. Devices that this Central never connects to (NPLAY, or HUB3 before 7.8) still take the NATIVE path.

**Exclusive device/probe ports on Windows.** `SO_EXCLUSIVEADDRUSE` replaces `SO_REUSEADDR` on Windows; POSIX is unchanged. The device bind error now reports the Winsock error and the address actually bound.

**Send-thread idle poll no longer spins.** The QPC busy-wait kept one core fully busy for the life of every STANDALONE session on Windows. It now blocks on a high-resolution waitable timer, falling back to `Sleep(1)`.

Docs describing the old fixed slot mapping are updated.

## Bench results (Windows 10, Gemini NSP + HUB1 + HUB2), master vs this branch

Run twice: with Central 7.7.0 and its firmware, then again with Central 7.8.0 and the 7.8 firmware.

| Scenario | master | this PR |
|---|---|---|
| STANDALONE, no Central | all connect | all connect (NSP 28 ch, hubs 256 ch each) |
| NSP + HUB1 + HUB2 concurrently: committed clock offsets | each keeps its own estimate. 7.7: 14–74 µs apart. **7.8 firmware: NSP 10.7 ms off the hubs** | identical (consensus median; the NSP's estimate is outvoted) |
| `simple_device NPLAY` CPU | ~101% of one core | ~1% |
| **Central 7.7** up → NSP session | `Failed to bind probe socket (winsock err 10013)` (#210) | CENTRAL mode, NSP's 28-ch config |
| **Central 7.7** up → HUB1 / HUB2 | CENTRAL | CENTRAL, same config |
| **Central 7.7** up → HUB3 | attaches to slot 2 and **silently serves the NSP** | native path (7.7 has no HUB3 slot); times out because no HUB3 is connected |
| **Central 7.8** up → NSP / HUB1 / HUB2 / HUB3 | CENTRAL (HUB3 slot empty, 0 ch) | identical: master's hardcoded slots were 7.8's |
| CereLink STANDALONE first, then Central 7.7 or 7.8 | Central binds the same ports, so both drive the device | Central can't bind the port and exits on launch; CereLink sessions unaffected |

With only the NSP open, its own clock estimate on the 7.8 firmware was up to ~190 ms off. That's the NSP's coarse probe-reply timestamps. Consensus corrects it only when hub sessions are also running.

### Central exiting when CereLink owns the device

This is expected: a STANDALONE session owns the device, so Central can't take it. Central doesn't handle the bind failure gracefully: it crashes (0xc0000005) on both 7.7 and 7.8. In the `GEMSTART == 2` block, a failed `Open()` NULLs `m_icInstrument[idx]` without marking the slot `NSP_NOIPADDR`. That's Central's behaviour and not something CereLink needs to work around. The alternative, deliberately coexisting with Central, is explored in #213.

## How the #210 asymmetry happened

`DeviceSession::create()` binds `0.0.0.0` (it resolves the client address but binds the caller's empty one), while the protocol probe binds the resolved `192.168.137.199`. Central binds that same specific address without `SO_REUSEADDR`. The probe's `SO_REUSEADDR` rebind is refused with 10013, but Windows lets the wildcard device socket coexist. This PR leaves the `0.0.0.0` bind alone, because changing it affects Linux broadcast reception and NPLAY loopback. Details in #213.

## Tests

- New `NativeConfigReaderTest.*` and `ProcessLiveness.*` drive the real reader against a real STANDALONE segment. The old multidevice test replicated the voting logic, so it passed on Windows despite the stub.
- New `CentralInstrumentIndex.*` checks the per-version table, and that every slot fits that version's `getMaxProcs()` (the check that failed in #210).
- New Windows-only `DeviceSessionTest.Windows_*` tests. With `SO_REUSEADDR` restored, `Windows_PortIsExclusiveWhileSessionIsActive` fails because a plain bind of the same port succeeds, which is the #210 situation.
- MinGW Debug on Windows: 508/508 ctest (run serially; integration tests use nPlayServer).

**Not yet run:** Linux/macOS builds (CI, plus a Mac test before merge).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d505db218a10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.