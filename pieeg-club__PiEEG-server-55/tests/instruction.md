# Issue

**Title:** Add hardware profiles for Pi 4 / Pi 5 SPI and GPIO differences

## Description

Supersedes #54.

## Why

@cameornh reported in #54 that the Raspberry Pi 5 needs different SPI/GPIO handling to talk to the PiEEG 8-pin shield: the kernel SPI driver already owns CE, so requesting GPIO19 as an output errors out, and 4 MHz SPI is unreliable. His PR fixed it for his setup but would have:
- regressed Pi 4 users (forced 2 MHz globally),
- broken 16-channel mode (chip 2's CS is wired to GPIO19 and must still be toggled manually).

## What

Introduces a small `HardwareProfile` system instead of branching behavior in place:

- **New** `pieeg_server/profiles.py` — `HardwareProfile` dataclass + a registry of two named profiles:
  - `pi4`: 4 MHz SPI, manage CS pin (= current behavior)
  - `pi5`: 2 MHz SPI, kernel-managed CS
- **Auto-detection** reads `/proc/device-tree/model`, falls back to `/proc/device-tree/compatible` (matching `bcm2712` / `bcm2711`), and finally falls back to `pi4` on any error or unknown hardware.
- **New** `--profile {auto,pi4,pi5}` CLI flag (default: `auto`) on the server, `record`, and `monitor` subcommands.
- `PiEEGHardware` accepts `profile=` (a `HardwareProfile`, name, or `None` for auto). 16-channel mode forces CS-pin management on regardless of profile, with a warning, because chip 2 needs it.
- `_cs_set()` is a no-op when CS is unmanaged. `_init_gpio` skips requesting GPIO19 when the profile says so. `_init_spi` uses `profile.spi_speed_hz`.

## No regressions

- Pi 4 / Pi 3 / Pi 2 users keep 4 MHz and the existing CS toggling — byte-identical to today.
- 16-channel mode keeps GPIO19 toggling for chip 2 even on Pi 5.
- Full test suite: **191/191 passing**.

## Tests

New `tests/test_profiles.py` (22 tests) covers:
- profile registry values (no-regression guard on `pi4` defaults),
- `get_profile` with named / `None` / `"auto"` / unknown,
- `detect_profile` with mocked `/proc/device-tree/model` and `/proc/device-tree/compatible` (Pi 5, Pi 4, Pi 3, missing files, unknown hardware),
- `PiEEGHardware` integration: default → `pi4`, `pi5` 8-ch disables CS management, `pi5` 16-ch forces it back on, custom `HardwareProfile` accepted, `_cs_set` no-ops when unmanaged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0ccf182a4c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.