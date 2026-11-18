# Issue

**Title:** Report a channel's scaling as a factor plus its unit

## Description

## Why

`cbPKT_CHANINFO` carries the raw ingredients of a channel's count-to-physical map, but every caller wanting to convert samples had to reassemble them from `digmin`/`digmax` against `anamin`/`anamax` — and guess at the unit.

That guess is the problem. Measured on real hardware:

| Device | Channel class | Reports | Per count |
| --- | --- | --- | --- |
| Gemini Hub 2 | `FRONTEND` (256 ch) | ±32764 ct ↔ ±8191 `uV` | 0.25 µV |
| Gemini NSP | `ANALOG_IN` (16 ch) | ±32767 ct ↔ ±5000 `mV` | 0.152593 mV |

The unit is **not uniform across a system**, so assuming microvolts is off by 1000x on analog in. And neither digital span is 2<sup>16</sup> — 65528 and 65534 — so the factor cannot be inferred from the ADC width either. A downstream consumer hardcoding `10/2^16` for the NSP is ~31 ppm off.

## What

`SdkSession::getChanScaling(chan_id, source)` returns `scale`, `offset` and `unit` together:

```
physical = raw * scale + offset
```

`ScalingSource` selects between `physcalin` (how the ADC digitizes — the default) and `scalin` (a user-defined transducer overlay). These are distinct fields and only the former describes the hardware; they read identically on the devices tested. Note the pre-existing C `cbsdk_session_get_channel_scaling()` reads `scalin`; it is unchanged.

The arithmetic lives in a free function, `channelScalingFrom(const cbSCALING&)`, so callers already holding a `cbPKT_CHANINFO` can convert without a session, and the math is testable without hardware.

Mirrored into the C API as `cbsdk_session_get_channel_conversion()` and pycbsdk as `Session.get_channel_conversion()`.

### Two deliberate choices

- **`anagain` is ignored.** It is documented as the gain applied to reach the analog values `anamin`/`anamax` already express, so the range endpoints alone define the map. It reads `1` on both devices tested. Silently multiplying by a field never exercised seemed worse than documenting the omission.
- **A zero digital or analog span is an error, not a neutral 1.0.** An unconfigured channel silently scaling by 1.0 is exactly how raw counts end up stored under a physical unit's name.

The offset numerator is computed in integer arithmetic (`anamin*digmax - anamax*digmin`) so the symmetric ranges real devices report resolve to exactly `0.0`; the obvious `anamin - digmin*scale` leaves a `-2.3e-13` residual on the NSP.

## Second commit: stop building the validation tools for consumers

Unrelated but needed for the same downstream release, and separable if you'd rather it went on its own.

Tests and samples are gated on `cmake_dependent_option` so they resolve to OFF when CereLink is not the top-level project. `tools/` was added later without the same guard, so every consumer built `validate_clock_sync` and `rx_bench` alongside the libraries it asked for. `rx_bench` links `ccfutils` → `pugixml`, so a consumer building for an architecture pugixml was not configured for fails to link — Orion hit this building a macOS universal binary. Adds `CBSDK_BUILD_TOOLS` following the existing pattern; standalone builds are unaffected.

## Testing

- 10 new unit tests covering both devices' real range values, asymmetric ranges producing a non-zero offset, endpoint round-tripping, a non-NUL-terminated `anaunit`, the zero-span error paths, and int32 span overflow.
- Verified end-to-end against a live Gemini Hub 2 and Gemini NSP through all three layers (C++, C API, pycbsdk), 272 channels, zero errors.
- Verified the tools still build standalone and no longer appear in a consumer's generated build.

Pre-existing unrelated failures in `CbsdkCApiTest`/`SdkSessionTest` (24) are unchanged — confirmed identical on a clean tree; they need a loopback device that was not running.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a888442dd927`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.