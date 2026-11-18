# Issue

**Title:** Fix Muse Athena macOS reconnect hangs

## Description

## Summary
- Avoid holding the Muse Athena scan mutex while stopping the macOS BLE scan.
- Clear the scan-found callback before stopping the scan to prevent callback re-entry during CoreBluetooth scan shutdown.
- Keep the fix scoped to `src/board_controller/muse/muse_athena.cpp`; this PR does not change vendored SimpleBLE code.

## Problem
On macOS, repeated `MUSE_S_ATHENA_BOARD` sessions can hang after BrainFlow logs `Found MuseAthena device` and before `Connected to MuseAthena Device`. In local live debugging this was reproducible across repeated short `prepare_session` / `start_stream` / `stop_stream` / `release_session` cycles.

The observed hang was not fixed by #836 alone. #836 correctly skips non-notify-capable Muse Athena characteristics, but the reconnect hang can happen earlier during scan shutdown / CoreBluetooth callback handling.

## Fix
The scan wait now runs in a limited scope so the Muse Athena mutex is released before `simpleble_adapter_scan_stop()` is called. The scan-found callback is also cleared before scan stop, so scan shutdown cannot re-enter the BrainFlow callback path while the board controller is moving on to connect.

## Validation
Tested locally on macOS arm64 with Muse S Athena (`MuseS-13D5`, firmware `3.1.23`):

- Built with BLE enabled: `cmake --build build --target BoardController --parallel 4`.
- `git diff --check` passes.
- Live 3-cycle reconnect smoke passed on this narrowed patch:
  `prepare_session -> start_stream -> get_board_data -> stop_stream -> release_session`
  completed 3/3 cycles in one child process.

Representative cycle output from the narrowed patch:

```text
Found MuseAthena device
Connect to MuseAthena Device attempt 1/3
Connected to MuseAthena Device
found control characteristic
Skip MuseAthena data characteristic 273e0014-4c4d-454d-96be-f03bac821358 because it does not support notifications
live_smoke_ok=True ok_cycles=3
```

## Notes
I originally tested an additional macOS SimpleBLE timeout hardening change while isolating the issue. That broader change has been removed from this PR to keep the fix Muse-specific and reduce risk for other BLE boards.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0cb27ee3407`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.