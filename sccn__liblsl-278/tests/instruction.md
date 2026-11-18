# Issue

**Title:** Send resolve queries from the receive socket (fix firewall-asymmetry resolution failures)

## Description

## Summary

Fixes the long-standing "streams aren't resolvable until I disable my firewall" failure by making the resolver send its query from the same socket it listens for replies on, so a stateful firewall sees a matching request/reply flow.

## Root cause

`resolve_attempt_udp` advertised one port but transmitted from another:

- The query payload embeds the **`recv_socket_`** port as the return port (`LSL:shortinfo … <return_port> <query_id>`).
- But the query was sent from one of three *separate* sockets (`unicast_/broadcast_/multicast_socket_`), each with its own ephemeral source port.

The outlet correctly replies to the advertised return port, but to a stateful firewall that reply is **unsolicited inbound UDP** (no prior outbound flow from that local port), so it's dropped. Disabling the firewall "fixes" exactly this. Time sync was never affected because `time_receiver` sends and receives on one socket — this change brings resolution in line with that.

## Fix

- Route **every** query flavor (unicast / broadcast / multicast) through `recv_socket_`.
- Give `recv_socket_` the `broadcast` option, the multicast TTL, and the per-interface `outbound_interface` option it needs to send all flavors.
- Remove the three now-unused send sockets.

Net diff is small: `src/resolve_attempt_udp.{h,cpp}` shrinks (one socket instead of four).

## Test

New `testing/int/resolve_query_port.cpp` (own executable, like `lsl_test_runtime_config`, because it sets the `api_config` singleton). It points discovery at loopback (`AddressesOverride={127.0.0.1}`), stands up a fake responder on `:16571`, captures the query, and asserts:

```
datagram source port == advertised return port
```

This is deterministic and needs **no firewall** — it verifies the exact property that makes a firewall accept the reply. The first commit adds the test (red: `16572 != <ephemeral>`); the second makes it green.

## Scope (intentionally narrow)

This PR is **only** the send-from-receive-socket change (firewall asymmetry). Deliberately **not** included, to keep review tight:

- The throwing `set_option(outbound_interface(...))` on bad interfaces (still uses the throwing overload here; separate fix).
- Port-range exhaustion / unicast probe coverage.
- A follow-up `lab.ResolveOverTCP` option (separate PR).

## Testing

Full suite green locally (macOS, universal build): new test passes, and `discovery` (live multicast/broadcast/unicast resolution, 730 assertions), `network`, `tcpserver`, and `runtime_config` all pass — confirming real discovery isn't regressed.

## Compatibility

Wire protocol unchanged; this only changes which local socket emits the query. No API or config changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2051c1ac259`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.