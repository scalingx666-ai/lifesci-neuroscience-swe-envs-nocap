# Issue

**Title:** Faster Google Cloud Storage reads: one async ranged GET per read

## Description

### Summary
Streaming from Google Cloud Storage (`GoogleCloudDataVault`) was ~10x slower than the Rust datastore when cold. There were two causes:
- **2 requests per read.** Each read was a ranged media GET plus a separate metadata GET, made only to get size and encoding.
- **Reads ran one at a time.** The blocking java-storage calls run inside Fox/Future callbacks on Pekko's dispatcher, which batches callbacks onto the current thread. During a cold histogram, at most **1** GCS request was ever in flight.

Each read is now a single non-blocking ranged GET to the GCS media endpoint, sent with Play WS like in `HttpsDataVault`. Behaviour stays the same, except for gzip-encoded objects:
- gzip-encoded objects are now returned decoded (`identity`), as `HttpsDataVault` already does. Ranged reads of such objects still fail.
- Content-Range is built from the response's object size.
- 404 → empty, a short object → failure.
- Same credential resolution, including ADC.
- Transient failures are retried with backoff.

Listing still uses java-storage.

**Measurements**: public `gs://h01-release/.../4nm_raw` (JPEG, sharded), layer bbox 2048×2048×256. Each run uses a fresh standalone datastore warmed on a local dataset, with variants alternated over 3 rounds. The workload is 3 orthogonal 512-voxel planes at mags 1 and 2-2-1, batches of 6 buckets, 6 requests in flight, plus the histogram.

| cold | master, median (min–max) | this PR, median (min–max) |
|---|---|---|
| full dataset open (168 requests, 1008 buckets) | 122.3 s (118.2–127.8) | **12.7 s** (12.4–12.9) |
| histogram alone | 52.4 s (49.0–53.7) | **3.5 s** (3.4–3.6) |
| histogram within the open | ~69 s | ~3.5 s |
| data request p50 / p95 | ~1.3 s / 6.4–11.3 s | ~0.4 s / 1.2 s |
| GCS HTTP requests per read | 2 | 1 |
| GCS requests in flight during histogram (max / mean) | 1 / 0.69 | 56 / 19.6 |

All passes returned identical status, byte lengths and empty/failure bucket headers, with no failures. For comparison, the Rust datastore took ~11 s for the same open.

The measurements above used a first version based on `java.net.http` (HTTP/2). After review, the read moved to Play WS (HTTP/1.1). A separate run of 3 alternating rounds of both variants showed no difference beyond noise: open 12.5 s (12.2–13.7) vs 13.0 s (12.8–13.6), histogram 3.6 s (3.5–3.6) vs 2.7 s (2.6–3.6), identical responses. The in-flight counts were only measured for the first version.

### Steps to test:
- `yarn test-backend` (`DataVaultTestSuite` covers GCS ranged/suffix/complete reads, gzip (now decoded to `identity`), 404, overreaching range, invalid credentials, and a new zero-length range case)
- Open a dataset streamed from GCS (e.g. h01 `gs://h01-release/data/20210601/4nm_raw`) and check it loads, histogram included
- Not tested: a private bucket with a real service-account credential

### FAQ

<details>
<summary><b>1. Why is this 10× faster when it only halves the requests?</b></summary>

Two separate effects. Requests per read went from 2 to 1, which was measured. The bigger effect is that reads now run in parallel. During the cold histogram, master never had more than 1 GCS request in flight (0.69 on average); this PR reaches 56 (19.6 on average). Both figures come from request/response timestamps in the HTTP client logs. At one request at a time, 71 reads × 2 round trips × ~0.35 s comes to roughly 50 s, which matches the measured 52 s.

</details>

<details>
<summary><b>2. Why did master run one request at a time? The dispatcher has <code>parallelism-factor = 10</code>.</b></summary>

The thread count is irrelevant here. The blocking calls ran inside Fox/Future callbacks on Pekko's default dispatcher. That dispatcher queues callbacks started from its own threads and runs them one after another on the same thread, unless the code is wrapped in `scala.concurrent.blocking {}`, and master's wasn't. This explanation is inferred from the in-flight=1 measurement and from how Pekko's dispatcher works. I did not build an ablation to prove it.

</details>

<details>
<summary><b>3. Wouldn't wrapping the old code in <code>blocking {}</code>, or a dedicated thread pool, have been enough?</b></summary>

It would likely fix the serialization, but each read would still cost two round trips and block a thread for both. I didn't build or measure that variant. The async single GET fixes both problems and matches what the Rust datastore does.

</details>

<details>
<summary><b>4. Why not keep java-storage and cache the metadata (size/encoding) per object?</b></summary>

It would remove most metadata requests for sharded data, since many reads hit the same shard file. But it adds a cache with invalidation questions, and it doesn't fix the blocking. The media response already carries both values (`Content-Range` total and `Content-Encoding`), so a cache isn't needed.

</details>

<details>
<summary><b>5. Why Play WS, like <code>HttpsDataVault</code>?</b></summary>

The first version used `java.net.http`, because Play WS (AHC) always decompresses gzip responses and the test "decode gzip correctly" then failed with `identity did not equal gzip`. That was only an outdated expectation: AHC also removes the `Content-Encoding` header, so the vault reports `identity` and the bytes match it. Following review, the vault now uses the injected `WSClient`, like `HttpsDataVault`. That removed the separate HTTP client, the deadline scheduler and the manual gunzip of transfer-compressed responses.

</details>

<details>
<summary><b>6. Is gzip handling identical to before?</b></summary>

Not exactly. Complete reads of gzip-encoded objects now return the decoded bytes with `identity` instead of the stored gzip bytes with `gzip`. Readers get the same data either way, because `VaultPath` decoded gzip before. The proxy routes now serve such objects uncompressed, as they already do for HTTPS vaults.

The request sends `Accept-Encoding: gzip`, so GCS never decompresses on the fly. That transcoding would ignore `Range` and send the complete object. Play WS then decodes gzip responses and drops `Content-Encoding`. For gzip-stored objects:
- Complete reads arrive compressed and are decoded by Play WS.
- Ranged reads return a slice of the gzip stream, which can't be decoded on its own. The vault fails them, as master did; it recognises them by 206 plus `x-goog-stored-content-encoding: gzip`. The test "fail when attempting range request on gzipped data" covers this.

Ranged reads of plain objects are unaffected by the header: GCS still answers 206 with exactly the requested bytes (checked with curl over HTTP/1.1 and HTTP/2).

<details>
<summary><b>7. Does <code>HttpsDataVault</code> have the same gzip problem?</b></summary>

Complete reads are fine: Play WS decodes them and reports `identity`. A ranged read of a gzip-encoded HTTPS object would hit the same undecodable-slice problem, but that's out of scope here.

</details>

<details>
<summary><b>8. What about credentials? Service accounts, application default credentials, anonymous access?</b></summary>

The code reuses `StorageOptions.getScopedCredentials`, so credentials resolve exactly as before, including ADC when none are configured; `NoCredentials` means anonymous access. Tokens come from `getRequestMetadata(uri, executor, callback)`. A cached token is used directly; a refresh, about once an hour, blocks a dispatcher thread briefly. Invalid credentials fail, and the unit test now uses a valid range so it actually exercises that path. **A private bucket with a real service account is untested**, because I had no credential. This is the main thing worth a manual check.

</details>

<details>
<summary><b>9. Retries: is this as robust as java-storage?</b></summary>

Similar, not identical. This PR retries connection errors (`IOException`) and HTTP 408/429/500/502/503/504 up to 5 attempts, with exponential backoff and jitter (250 ms × 2ⁿ). An attempt that runs into its 10-minute timeout is not retried, because a retry would likely stall again. Failed reads aren't cached, so the next request for the same data starts fresh. java-storage's default retry policy differs in detail (attempt count and an overall deadline).

</details>

<details>
<summary><b>10. Timeouts?</b></summary>

Each attempt has a 10-minute request timeout (`withRequestTimeout`, the same as `HttpsDataVault`), which covers headers and body, so a stalled transfer can't hang forever. Connect timeouts come from the Play WS config, as for `HttpsDataVault`. java-storage used 20 s connect and read timeouts.

</details>

<details>
<summary><b>11. Content-Range header: same format as before?</b></summary>

Yes. It's rebuilt with `range.toContentRangeHeaderWithLength(objectSize)`, taking the object size from the response's `Content-Range` total, or from the body length if GCS returns 200. Complete reads return `None`, as before.

</details>

<details>
<summary><b>12. Edge cases: overreaching ranges, invalid ranges, zero-length ranges, missing objects?</b></summary>

- A range past the end of the object: GCS returns fewer bytes, and the length check turns that into a failure, as master did (test passes).
- Negative or inverted ranges: rejected before any request (test passes).
- Zero-length ranges such as `start == end`: these are legitimate, since empty minishard indices produce them. They return an empty array without a request, as master effectively did. I added a test.
- Missing object: 404 gives an empty result (tests pass).
- If GCS ignores `Range` and returns 200, the requested slice is cut from the full body.

</details>

<details>
<summary><b>13. Memory: is the whole response buffered?</b></summary>

Yes, Play WS buffers the body. Master also read the full range into a buffer and then copied it. No change in peak memory per read. AHC caps decompressed responses at 256 MB (`maxDecompressedResponseSize`), which is far above chunk and shard-slice sizes.

</details>

<details>
<summary><b>14. Connection pooling, client lifecycle?</b></summary>

The vault uses the datastore's injected `WSClient`, like `HttpsDataVault`, with its connection pool and lifecycle. AHC speaks HTTP/1.1, while the first `java.net.http` version used HTTP/2. The re-run (see Measurements) showed no difference beyond noise.

</details>

<details>
<summary><b>15. Custom endpoints and emulators?</b></summary>

The host comes from `storageOptions.getHost`, so it follows whatever `StorageOptions` resolves (the default `https://storage.googleapis.com`). The path is the documented [`objects.get`](https://docs.cloud.google.com/storage/docs/json_api/v1/objects/get) media endpoint `/storage/v1/b/{bucket}/o/{urlencoded name}?alt=media`. java-storage itself calls the equivalent `/download/storage/v1/...` path. I didn't test against an emulator.

</details>

<details>
<summary><b>16. Object names with special characters?</b></summary>

Names are URL-encoded with `URLEncoder` (UTF-8), with `+` replaced by `%20`, so `/` becomes `%2F` as the JSON API requires. Only covered by the normal paths in the tests and h01, no exotic names.

</details>

<details>
<summary><b>17. Listing and storage usage?</b></summary>

Unchanged; they still use java-storage. They aren't on the hot path.

</details>

<details>
<summary><b>18. Are the responses really identical to master?</b></summary>

Status, byte lengths and the empty/failed-bucket headers were identical on every benchmark pass, with 0 failures. Response bodies weren't hashed in this comparison. The image decoding code is unchanged, so they should be byte-identical, but I didn't compare them.

</details>

<details>
<summary><b>19. How was it measured? Isn't internet latency noisy?</b></summary>

Each variant ran 3 cold runs, alternating between master and this PR, each on a fresh standalone datastore warmed on a local dataset. The workload replays a viewer opening the dataset (3 orthogonal 512-voxel planes at mags 1 and 2-2-1, 6 requests in flight), plus the histogram. The ranges don't overlap at all: 118–128 s vs 12.4–12.9 s.

</details>

<details>
<summary><b>20. Do other vaults have the same blocking problem?</b></summary>

Not checked. S3 and HTTPS vaults use async clients, which fits their not showing the gap. Any other blocking I/O inside Fox callbacks on the dispatcher may be serialized the same way and would be worth a separate look.

</details>

<details>
<summary><b>21. Does this need a datastore update after deployment?</b></summary>

Yes, it only changes the datastore. There's no API or config change.

</details>

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `637428df297d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.