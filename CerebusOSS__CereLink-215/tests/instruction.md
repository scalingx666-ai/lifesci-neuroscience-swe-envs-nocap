# Issue

**Title:** Talk to the device directly by default, alongside Central; deprecate Central-compat mode

## Description

Addresses #213.  / #214.

## Summary

A CereLink STANDALONE session can share a device with a running Central on the same Windows PC, so CereLink no longer needs to go through Central's shared memory to coexist with it. This PR makes talking to the device directly the default, and turns the Central-compatible attach into an opt-in, deprecated mode slated for removal in the next major release.

## Changes

**Shared device port on Windows (cbdev)**
- The device socket uses `SO_REUSEADDR` again, reverting #212's `SO_EXCLUSIVEADDRUSE`, under which Central 7.6–7.8 crashed on launch.
  - Central binds each Gemini port on the instrument-network address (e.g. `192.168.137.199:51002`) without `SO_REUSEADDR`.
  - The session binds the wildcard address with `SO_REUSEADDR`.
  - Windows allows that pair in either start order. The devices broadcast everything, so both sockets receive the full stream.
- The protocol probe binds the wildcard too, matching the device socket, instead of the detected address Central holds. That detected-address bind was the `WSAEACCES` (10013) in #210. Loopback, used by NPLAY, stays specific.
- Comments at `bind()` explain why the wildcard bind is load-bearing.

**Connection mode (cbsdk)**
- By default a session attaches to another CereLink session's native shared memory for the device, or owns the device. It never touches Central's shared memory.
- The deprecated Central-compat path is selected with the environment variable `CERELINK_CENTRAL_COMPAT=1`, not an API parameter, so the C++, C and Python APIs and the `cbsdk_config_t` layout are unchanged.
  - It only applies while Central is running and has a slot for the device. Without Central, or for a device Central has no slot for (NPLAY, HUB3 before 7.8), the session talks to the device directly as usual.
  - With Central running and a slot, it attaches to Central's shared memory or fails; it does not fall back.
  - It prints a one-time stderr notice.
- #212's "refuse while Central is running" logic is gone; by default it's no longer needed.
- `ShmemLayout::CENTRAL` and the `central_client` example are marked deprecated.
- The soak harness sets `CERELINK_CENTRAL_COMPAT=1` for `--central` runs.
- Docs updated: README, pycbsdk README, `shared_memory_architecture.md` (new "Running alongside Central" section), and the sequence diagrams.

## Is removing the Central path possible?

Yes, as far as we can tell. The one obvious Central-only feature, recording control, works from a NATIVE session. The device echoes `SETFILECFG` as a broadcast `REPFILECFG`, and Central's File Storage acts on it. This was verified: a STANDALONE session opened File Storage, recorded and closed it, and the files were written.

## Bench results (#213 matrix)

Setup: Central 7.8.0, firmware 7.8, HUB1 + HUB2 at 256 ch × 30 kHz.

| Scenario | CereLink STANDALONE | Central's view |
|---|---|---|
| CereLink alone | 30k samples/s, 0 missing, `sync()` < 1 ms, clock ±130–150 µs | – |
| Central alone | – | 30k/s, 0 missing, `sync()` ~20 ms, clock ±10 ms |
| Central first, then CereLink | 0 missing, `sync()` < 1 ms | 0 missing |
| CereLink first; Central starts, then closes | 0 missing across both transitions | 0 missing |
| CereLink opens and closes twice under Central | 0 missing | 0 missing |
| Central records while CereLink streams | 0 missing | file written |

- **Config propagation:** labels, spike thresholds and sample-group membership changed from either side were seen by the other within 20–60 ms.
- **Earlier check on Central 7.7:** master's sessions also coexisted with it.
- **This branch with Central 7.8 running:**
  - Default `Session(HUB1)` → STANDALONE, ~30k samples/s, no warning.
  - `connection_mode="central"` (since replaced by `CERELINK_CENTRAL_COMPAT=1`) → attaches through Central.

## Known caveats (documented)

- A custom *specific* `custom_client_address` cannot share the port with Central; leave it unset.
- Central's Standby / Shutdown buttons reset or power down the devices for everyone. Closing Central normally doesn't touch them.
- About 0.6% of the time the device splits a millisecond of samples into two datagrams 3–4 µs apart, and Windows occasionally delivers the second first.
  - Over 10 minutes: 6 events, seen identically by Central and CereLink.
  - The wire capture showed perfect order, so this happens below both sockets.
  - Nothing is lost, but timestamps step backwards once.

## Compatibility

- **Behaviour change:** sessions that used to auto-attach to Central now talk to the device directly. Data, config and recording all keep working. Code that needs Central's shared memory must now set `CERELINK_CENTRAL_COMPAT=1`.
- **API / ABI:** unchanged.

## Tests

- New Windows-only `DeviceSessionTest`s (they replace #212's exclusive-port tests):
  - `Windows_CentralCanBindAfterSession`
  - `Windows_SessionCanBindAfterCentral`
  - `Windows_ProtocolProbeCanBindAfterCentral`: holds the detected 192.168.137.x address the way Central does; skips without such an adapter.
- Each was checked to fail against the old behaviour. The probe test reproduces #210's exact `Failed to bind probe socket (winsock err 10013)` without the factory change.
- `SessionLifecycleTest.CentralCompatEnvWithoutCentralSlotIsStandalone` (nPlayServer): with `CERELINK_CENTRAL_COMPAT=1` and no Central slot for the device, the session is still STANDALONE.
- macOS (env-var rework): ctest 422/422 run serially.
- MinGW Debug, Windows 10: ctest 510/510 run serially with Central running (3 skipped), plus the pycbsdk tests.

A session-side recording gate is proposed separately in #218.

**Not verified:**
- Linux builds (CI).
- Legacy (non-Gemini) NSP alongside Central.
- The README's nPlayServer + Central loopback setup. NPLAY's code path is unchanged by this PR.
- Windows 11.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6447758774d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.