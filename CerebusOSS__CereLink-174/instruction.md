# Issue

**Title:** Fix nsp clock sync

## Description

The nplay probe header->time is not filled correctly on the Gemini NSP. It seems to be derived from a different, buggy counter that runs at 95.6% of real time (exactly 0xE000 ticks per 2-second interval instead of 60000).

This PR adds a fallback method when the clock offset estimation is pure. It simply uses the most recently-received packet's timestamp compared to its receipt time, and assumes 700 microseconds of ESW processing + transmission latency.

I don't like hard-coding this kinds of assumptions but it's approximately correct based on some timing I've done with a raspberry pi slaved to the Gemini device's PTP clocks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c6c5f9717847`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.