# Issue

**Title:** tests: make the tcpserver test big-endian clean

## Description

The tcpserver unit test hard-codes little-endian byte patterns and reads a wire length prefix through a host-order pointer cast, so it fails on big-endian hosts (e.g. s390x). The library itself is endian-correct; only the test fixtures assume a little-endian host.

This patch contains two fixes:

 * check_streamfeed_100_response() reads the 2-byte info-length prefix of the portable binary archive via *reinterpret_cast<const uint16_t*>. The portable archive always serialises integers little-endian on the wire, so on a big-endian host this reads the length byte-swapped (e.g. 0x7102 instead of 0x0271), making the subsequent size check fail. Decode the two bytes explicitly as little-endian instead.

 * The "basic" string-channel case compares against TESTPAT_TIMESTAMP, the little-endian encoding of the timestamp double. String streams carry zero-size values, so the server performs no endian conversion and emits the timestamp in host byte order; the expected pattern must therefore be byte-reversed on big-endian hosts.

No behavioural changes on little-endian hosts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e651023ca679`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.