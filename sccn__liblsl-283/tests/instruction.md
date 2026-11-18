# Issue

**Title:** Don't let a bad multicast interface abort (or terminate) stream resolution

## Description

## Summary

Makes stream resolution survive an unusable multicast interface instead of silently abandoning the resolve wave — or crashing the process. This is the best code-level match for "plugging in a VPN / starting Docker breaks LSL discovery."

## Root cause

For each multicast send, the resolver selects the outbound interface via `multicast_socket_.set_option(outbound_interface(...))` using the **throwing** overload (`src/resolve_attempt_udp.cpp`). An interface address that can't be used for `IP_MULTICAST_IF` — a VPN `utun`, AWDL, a Hyper-V/VirtualBox adapter, or an address that changed since enumeration — makes this throw. Because it runs **inside an asio completion handler**:

- in `resolve_oneshot`, the exception propagates out of `io_->run()`, aborting the wave and discarding results already received;
- in the continuous resolver, the background thread runs `io->run()` with **no try/catch**, so the uncaught exception calls `std::terminate()` and takes the process down.

(The outlet's IO threads already have a catch-and-retry loop; the resolver's thread was just never given one.)

## Fix

- `resolve_attempt_udp`: use the `error_code` overload of `set_option` and, on failure, log at verbosity 1 and carry on. Multicast sends on that pass fall back to the socket's default interface (and individually no-op on send error), while the **unicast and broadcast** targets — which don't depend on the outbound interface — still go out.
- `resolver_impl`: wrap the continuous resolver's background `io->run()` in the same catch-and-retry loop the outlet's IO threads use, so any other stray handler exception can't terminate the process either.

## Test

New `lsl_test_resolve_bad_interface` (own executable, since it sets the `api_config` singleton): configures an unusable multicast interface (`203.0.113.1`, TEST-NET-3 per RFC 5737) and asserts a local stream still resolves without crashing. Pre-fix it fails with "An internal error has occurred" (the asio exception thrown out of `resolve_oneshot`); post-fix it passes.

## Testing

Full suite green locally (macOS universal): new test passes; `discovery`, `network`, `tcpserver`, and `runtime_config` are unaffected.

## Scope / relationship

- No wire protocol, API, or config changes.
- Independent of #278/#279 and of the sibling PR fixing the same-machine unicast lottery (#282); the changes don't overlap.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15f3ca7acdd1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.