# Issue

**Title:** fix(server): bind loopback by default, WIKI_HOST to override

## Description

`main()` bound `0.0.0.0` unconditionally. That was defensible while the server was an API for remote agents; now that #210 added `/ui` — a browser console over the whole vault — a bare `python -m obsidian_wiki.server` on a box with a public address exposes it to the internet.

- Default `host` is now `127.0.0.1`
- `WIKI_HOST` overrides it
- The Dockerfile sets `WIKI_HOST=0.0.0.0`, so `docker run -p 8080:8080 ...` behaves exactly as before
- Documented in `docs/configuration.md` and `docs/deployment.md`

Parametrized test asserts both the default and the override reach `uvicorn.run`.

**Behavior change worth calling out:** anyone running the server bare (not via Docker) and reaching it from another machine now needs `WIKI_HOST=0.0.0.0`. That's the intended trade — it's exactly the case that was silently exposed.

Addresses the loopback-by-default point in #208.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8f29b3e8465`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.