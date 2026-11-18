# Issue

**Title:** Optimize endianness operations

## Description

This PR contains four improvements to endianness operations:

- Move endianness detection / helpers to utils/endian.hpp
  Endianness checks / conversions are gathered in one place
- Only store if endianness should be swapped, not the desired endianness. As Boost.Endian only supports swapping between little and big endian, this makes the code a bit easier to read and reason about.
- Pre-compute endian conversion performance once
  The endian conversion performance is measured only first time it is requested, speeding up the connection handshake by 10ms.
- Optimize single-byte writes/reads
  Reading / writing single bytes uses `streambuf::sbumpc()` and `streambuf::sgetc()` instead of reading/writing buffers of length one. It also makes the code a bit shorter by omitting the `reverse_byte_order` parameter.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `786dfcc1cf93`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.