# Issue

**Title:** Two minor stream resolution improvements

## Description

This PR includes two improvements to the resolver.

8eec428 raises exceptions for some documented invalid operations:

``` cpp
lsl::resolver_impl resolver;
resolver.results(); // throws, no resolve started so far
resolver.resolve_continuous(…); // ok
resolver.resolve_oneshot(); // throws, continuous resolution in progress
resolver.resolve_continuous(…); // throws, continuous resolution in progress
```

b7af329 speeds up stream resolution by up to `multicast_min_rtt`. By default, `resolver_impl::resolve_oneshot()` sends query packets, waits for results and checks if enough streams have been found whenever a new round of query packets is sent (once ever `multicast_min_rtt` seconds, 0.5 by default. b7af329 checks the completion criteria every time a new stream has been found so stream resolution can finish much sooner. This makes it possible to raise the `multicast_min_rtt` (as it doesn't influence the initial stream resolution time) and speeds up stream recovery (which relies on `resolve_oneshot()`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `055a1bd85014`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.