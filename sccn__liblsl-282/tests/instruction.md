# Issue

**Title:** Resolve all same-machine streams (fix the 127.0.0.1 unicast lottery)

## Description

## Summary

Fixes the long-standing "only one of my local streams shows up, and which one shuffles when I restart things" failure. Same-machine discovery relied solely on a unicast query to the shared `multicast_port` (`127.0.0.1:16571`); the fix additionally probes the machine-local addresses across the per-stream service-port range, where every stream owns a unique socket.

## Root cause

`MachineAddresses` (default `{127.0.0.1}`) is folded into the multicast address list and queried only at `multicast_port` (16571). But `127.0.0.1` is a **unicast** address, not a multicast group: the OS delivers a datagram sent to a shared port to **only one** of the responder sockets bound there. So when several outlets run on a machine, only one answers a discovery query, and which one depends on socket bind order. Restarting programs shuffles which stream is visible.

This is the mechanism behind a cluster of reports: #28 (Azure macOS, only one stream resolves — diagnosed in-thread as exactly this), #92 (the issue literally titled "Remove 127.0.0.1 from multicast addresses"), #202 (Windows→Linux, order-dependent), and #207 (Android, only one stream when no Wi-Fi/loopback only).

## Fix

In addition to the `16571` query, probe each machine-local address across the per-stream service-port range `[base_port, base_port+port_range)` (16572–16603), where each outlet binds its own unique socket and answers `LSL:shortinfo`. This mirrors how `KnownPeers` are already sprayed and needs **no OS routing changes**.

- `api_config`: parse and expose `machine_addresses()` (the unicast subset of `multicast.MachineAddresses`).
- `resolver_impl`: add those addresses to the unicast target list in the resolver's constructor.

`127.0.0.1` is intentionally left in the multicast list too (covered redundantly and harmlessly at 16571), so there is no behavior change for setups that relied on it, and #92's "remove 127.0.0.1 + add a loopback multicast route" workaround is no longer needed.

## Test

New `lsl_test_resolve_machine` (own executable, like `runtime_config`, since it sets the `api_config` singleton): under `ResolveScope=machine` it stands up 3 local outlets and asserts all 3 resolve. Pre-fix this fails deterministically as `1 == 3` (the lottery); post-fix all are found.

## Testing

Full suite green locally (macOS universal): new test passes; `discovery` (live UDP resolution, 724 assertions), `network`, `tcpserver`, `streaminfo`, and `runtime_config` are unaffected by the now-default loopback unicast wave.

## Scope / relationship

- Wire protocol, API, and config defaults unchanged — only adds extra local unicast probe targets.
- Independent of #278 (firewall asymmetry) and #279 (TCP fallback), and of the sibling PR fixing a bad-multicast-interface crash. All touch the resolver subsystem but the changes don't overlap.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c1e5ff62c32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.