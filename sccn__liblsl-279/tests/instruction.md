# Issue

**Title:** Add lab.ResolveOverTCP: a firewall-robust TCP-probe discovery fallback

## Description

## Summary

Adds an opt-in, firewall-robust stream-discovery fallback: `lab.ResolveOverTCP` (default **off**). When enabled, a resolve additionally finds streams by connecting to their **TCP data ports** directly, instead of relying solely on UDP multicast/broadcast/unicast.

This complements (and is independent of) #278: where #278 makes UDP discovery itself firewall-friendly, this PR provides a path that avoids UDP discovery entirely for same-machine and known-host setups.

## Why

UDP discovery replies can be silently dropped by stateful firewalls (and UDP multicast can be blocked on many networks). TCP is a symmetric, connection-oriented protocol that a stateful firewall tracks natively, so probing the data ports directly is robust where UDP discovery isn't. The cost is speed — see below.

## How it works

When `ResolveOverTCP` is enabled, the resolver builds a target list of **loopback (`127.0.0.1`/`::1`) + every `KnownPeer`**, each crossed with the `BasePort..BasePort+PortRange` range. Alongside the normal UDP waves it fires a TCP probe burst (`resolve_attempt_tcp`): for each target it connects, sends `LSL:shortinfo`, reads the reply, and stores the resulting `stream_info` (host taken from the dialed endpoint, ports from the reply XML). Probes run through a small worker pool (cap 16), bounded by a deadline and cancelled the moment enough streams are found.

## Cost (documented loudly)

This is **slow**: one connection attempt per port per host, and closed/filtered remote ports each cost a full connect timeout. A `WARNING` is logged when the option is enabled. Best suited to loopback / a small static `KnownPeers` set, not broad discovery.

## Changes

- **`api_config`** — `lab.ResolveOverTCP` option + getter + enable-time warning.
- **`resolve_attempt_tcp`** (new) — async, worker-pool TCP prober mirroring `resolve_attempt_udp`'s structure and cancellation.
- **`resolver_impl`** — builds the TCP target list; fires a throttled TCP burst per wave, guarded against overlapping bursts via an in-flight check.
- **`tcp_server`** — prerequisite fix: the TCP `LSL:shortinfo` responder now keeps the client session alive through the reply write (it previously captured only the `tcp_server`, risking a destroy-mid-write). This path had no consumer before; this PR is the first.

## Test

`testing/int/resolve_over_tcp.cpp` (own executable, like `runtime_config`, since it sets the config singleton): blinds UDP discovery completely (`ResolveScope=machine` with empty `MachineAddresses`, empty `KnownPeers`) and asserts a local stream is still resolved — so the hit can only have come from the TCP probe.

## Testing

Full suite green locally (macOS universal): the new test passes, and with the feature off (default) `discovery` (live UDP resolution, 730 assertions), `network`, `tcpserver`, and `runtime_config` are unaffected.

## Notes

- Opt-in and default-off: no behavior change unless `ResolveOverTCP = 1` is set.
- liblsl config booleans are `1`/`0` (`from_string<bool>` is `str == "1"`), so the setting is `ResolveOverTCP = 1`. The `lslapicfg` docs (separate repo) should document the option and the slowness warning.
- Independent of #278; both touch the resolver subsystem but the changes don't overlap.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72f01452c199`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.