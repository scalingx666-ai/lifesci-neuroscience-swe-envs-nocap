# Issue

**Title:** Fix Brandl2020 downloading HTML error pages instead of data

## Description

.

## The bug

`Brandl2020` downloaded **16 subject files and the montage as byte-identical 1306-byte HTML pages**, and nothing raised. DepositOnce migrated to DSpace 7, and its web host now answers *every* path — including ones that used to be files — with **HTTP 200** and the Angular app shell instead of a 404:

```console
$ curl -sL -o /dev/null -w '%{http_code} %{size_download}B %{content_type}\n' \
    https://depositonce.tu-berlin.de/bitstreams/handle/11303/10934.2/pp2.mat
200 1306B text/html; charset=utf-8
```

Because the status is 200, pooch cached the error body under the `.mat` name and recorded a successful download. Every later call was then served that cache without touching the network, so the failure only surfaced when something tried to *read* the file.

## The fix

**The REST API is on a different host.** That is why probing `depositonce.tu-berlin.de` looks like a total outage — even `/server/api` returns the shell. The front end names its own API location in `assets/config.json`:

```console
$ curl -s https://depositonce.tu-berlin.de/assets/config.<hash>.json | jq .rest.baseUrl
"https://api-depositonce.tu-berlin.de/server"
```

That host serves the bytes and honours Range requests. The per-file bitstream UUIDs needed to address it **were already in this module but never used** — `_BITSTREAM_UUIDS` was dead code while `data_path` still built URLs against the broken host. This PR wires them up.

**And verifies what arrives.** Every file here is MATLAB v5 or v7.3, both of which begin with the ASCII banner `MATLAB`. A payload that does not is deleted and raises with an explanation. A cached bad file is worse than a failed download — it fails at analysis time, far from the cause.

`data_dl` gains an optional `fname`, because DSpace serves every bitstream from `.../bitstreams/<uuid>/content`; without it all 17 files would be stored as `content`.

## Verification

I downloaded the full distribution through this route: **19 files, 10.59 GiB**, each checked against the size and checksum the API reports, all valid MATLAB.

```
mnt.mat 1285 B · bands.mat 256 B · ivals.mat 256 B · README.md 3321 B
pp1.mat … pp16.mat   (615–802 MiB each)
```

New tests (parametrized) cover: the URL targets the API host with the right UUID, `fname` is passed so files are not all named `content`, an HTML/empty/garbage payload raises **and is removed from the cache**, and an unknown filename is rejected.

`pytest moabb/tests/test_download.py moabb/tests/test_datasets.py` passes; `ruff check` and `ruff format` are clean.

## Note for maintainers

Two things I deliberately left out of this PR:

1. **`bands.mat` and `ivals.mat` ship with the distribution but are not fetched** by this module. I did not add them, since nothing in the loader uses them — flagging in case that is unintentional.
2. **The guard here is dataset-local.** A `content-type` check inside `data_dl` would protect every dataset against this class of failure, but it risks breaking downloads I cannot test, so it felt wrong to bundle with a bug fix. Happy to send it separately if you want it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d9f3dfd0ed2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.