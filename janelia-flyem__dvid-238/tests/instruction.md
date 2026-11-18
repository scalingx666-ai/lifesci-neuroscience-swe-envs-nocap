# Issue

**Title:** server_local: Allow TOML to contain relative paths

## Description

Allow the dvid config TOML to contain relative paths for `webClient`, `logfile`, and store `path`.  Relative paths are interpreted as relative to the TOML file's directory (regardless of the user's `$PWD`).

Supports TOML files such as this:

```toml
[server]
httpAddress = ":8000"
rpcAddress = ":8001"
webClient = "../dvid-distro/dvid-console"

[logging]
logfile = "dvid.log"
max_log_size = 500
max_log_age = 30

[store]
    [store.raid6]
    engine = "basholeveldb"
    path = "./dbs/dvid-datastore"
```

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/238)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4095be8e6ca6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.