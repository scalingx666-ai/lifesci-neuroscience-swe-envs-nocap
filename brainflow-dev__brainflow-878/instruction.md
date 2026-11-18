# Issue

**Title:** Fix ADC sign conversion, upsampling, BLE buffer bounds, and memory le…

## Description

### Summary
This PR fixes several signal-integrity, buffer-safety, and memory-management bugs across board drivers and adds unit test coverage for `custom_cast.h`:

1. **PIEEG (`src/board_controller/pieeg/pieeg_board.cpp`)**:
   - Use `cast_24bit_to_int32(buf + offset)` instead of `uint32_t voltage = 16777214 - voltage;`, which inverted negative 24-bit ADS1299 samples into positive values and underflowed unsigned `uint32_t` when `voltage == 0xFFFFFF`.
   - Remove unused `eeg_scale`, `data_test`, and `data_check` variables.
2. **EmotiBit (`src/board_controller/emotibit/emotibit.cpp`)**:
   - Fix 2x ancillary upsampling index from `anc_packages[i + 1][channel_index] = anc_packages[i][channel_index]` to `anc_packages[i * 2 + 1][channel_index] = val` so samples are properly duplicated into `[2 * i, 2 * i + 1]` without overwriting prior entries.
   - Clamp `MAGNETOMETER_Z`, `PPG_GREEN`, and `EDA` package loops to `max_datapoints_in_package`.
3. **BrainAlive (`src/board_controller/brainalive/brainalive.cpp`)**:
   - Pass `byte_array.size()` instead of `sizeof(byte_array)` (`sizeof(std::vector<uint8_t>)`) to `simpleble_peripheral_write_command`.
   - Fix per-packet memory leak of `package` in `BrainAlive::read_data`.
   - Guard against division by zero before gain handshake and use `cast_24bit_to_int32` / `cast_16bit_to_int32` instead of `- 65535`.
4. **NeuroPawn Knight & Mentalab Explore (`knight.cpp`, `knight_imu.cpp`, `explore.cpp`)**:
   - Check `if (res > 0)` when reading serial payload bytes in `Knight::read_thread` (matching `KnightIMU::read_thread`).
   - Pass missing format arguments to `safe_logger` calls in `knight.cpp`, `knight_imu.cpp`, and `explore.cpp`.
5. **Unit Tests (`src/tests/utils/custom_cast_unittest.cpp`)**:
   - Add GoogleTest unit tests for 24-bit, 16-bit, 15-bit, and 13-bit signed two's-complement casts and bit-extraction helpers in `custom_cast.h`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `915009afb0a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.