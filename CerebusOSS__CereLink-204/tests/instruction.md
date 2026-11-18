# Issue

**Title:** Speed up STANDALONE UDP reception, and stop the false drop alarm

## Description

Investigating a reported increase in dropped packets. The headline is that there was no increase — but the receive path did have real waste in it, and the drop detector was lying.

## The reported drops were not real

`[cbdev] dropped N of M packets` compared the device's `cbPKT_SYSPROTOCOLMONITOR.sentpkts` against our own count **one interval at a time**, and logged every shortfall. That is not a loss measurement. A packet sent just before a monitor packet can be reassembled just after it, so it lands in the next interval — a deficit in one, a matching surplus in the next. Only deficits were ever examined.

Measured on a Gemini HUB2 at 128 ch SR_RAW over 5.4M packets:

| | short intervals | over intervals | net |
|---|---|---|---|
| HUB2 | 76 (728 packets) | 38 (729 packets) | **−1** |
| HUB1 (256 ch) | 0 | 0 | 0 |

Zero real loss, yet the old detector fired roughly once a second indefinitely. HUB1 doesn't straddle at all, which made the noise look device-specific and credible.

The detector now tracks a running sent/received balance. Straddled packets cancel on the next interval; genuine loss does not. The same setup now reports 36 lost out of 3.6M — all from the config dump at startup — then falls silent.

## PR #190 is not implicated

A/B against the #190 merge base (`b10b0a4`) on live HUB1 + HUB2 at 256/128 ch SR_RAW: identical CPU (user 0.79 s, sys 2.80 s per 42 s) and identical loss. No throughput regression to bisect.

One trap for anyone re-measuring: HUB2's ~10 ms clock uncertainty (vs HUB1's ~250 µs) comes from `d61deeb` "Charge only unexplained spread to probe uncertainty", which landed **after** the #190 base. Baselining clock sync against that base makes it look like a regression when it isn't.

## What was actually slow

Profiling the receive path found the datagram-complete callback running the entire cross-device clock consensus on the UDP receive thread, once per datagram (~30 kHz). Only the probe was rate-limited. With no NSP or HUB3 present, that was ~90,000 *failing* `shm_open` calls per second per device, plus a `kill(2)` per live peer and a heap allocation per datagram — all on the thread that has to get back to `recvfrom()`.

Clock maintenance now runs on the 100 ms cadence the probes already used; nothing there can produce a new answer faster than the probes feeding it. Absent peers back off. Votes use a fixed array.

Separately, `dispatchPacket` deep-copied up to four `vector<std::function>` per packet (the comment claimed it "just copies a few pointers+sizes"). Those are now copy-on-write, so a snapshot is a refcount bump.

| metric (live HUB1 + HUB2, SR_RAW) | before | after |
|---|---|---|
| `shm_open` profile samples | 34 | **0** |
| `kill` profile samples | 14 | 1 |
| `dispatchBatch` samples | 46 | 14 |
| receive-thread non-blocked time | 43 | 10 |
| user CPU / 30 s | 0.81 s | **0.63 s** |

## Compatibility

No wire format, shared-memory layout, or Central-adapter changes. `signalData()` still fires per datagram, so CLIENT readers wake exactly as before; only the clock *publication* moves to 10 Hz, which is the rate the underlying estimate updates anyway.

Verified with a live CLIENT attached to a STANDALONE owner on the same segment: zero ring overruns, zero missing packets, full 30 kHz, and the client's offset tracked the owner's to within 54 µs against a 256 µs uncertainty.

## New tool

`tools/rx_bench` attributes packet loss to a layer using two independent measures — firmware reconciliation over whole monitor intervals (reporting deficit and surplus separately, so straddling can't be mistaken for loss) and group-timestamp contiguity — plus SDK queue drops and clock health. Run a second instance against the same device to exercise the CLIENT-mode shmem ring.

It earned its keep mid-review: it caught a genuine one-off 1.3% loss burst on HUB1, with both independent measures agreeing (7507 missing by timestamps, 7529 by firmware). Not reproducible in five subsequent attempts of the same sequence, so environmental rather than code — but it's the kind of event the old detector buried in noise.

## Testing

- 396/396 unit, 94/94 integration against live HUB1 + HUB2 (2 skipped: need an NSP / nPlay).
- 3-minute soak, both hubs: 5.42M packets each, 0 missing, 0 queue drops, 0 shmem errors.

One test changed: `SdkSessionTest.SetCallbacks` asserted a packet callback had *not* fired, which is a race against a live HUB1 at 30 kHz rather than an invariant. It passed only because dispatch was slow, and began failing intermittently once dispatch got faster. It now asserts the registration contract; `ReceivePackets_FromDevice` already covers callbacks actually firing.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8fd98303474`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.