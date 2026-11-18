# Issue

**Title:** Add remote-read support to `read_nwb`

## Description

.

The main contribution of this PR is enabling `pynwb.read_nwb(path)` to read nwbfiles in remote public locations such as public DANDI Archive assets served over HTTPS (e.g. `https://dandiarchive.s3.amazonaws.com/...`) or any publicly-readable S3, GCS, or HTTPS object store.

To move this forward I have decided not to use the `can_read` methods for dispatch, like I did in #1994 for local file support. What we have here is simple URL pattern matching: routing based on conventions like the `.zarr` suffix and DANDI's `/zarr/<uuid>/` URL layout, without opening the file. This avoids the performance cost of reading the file twice and in addition does not overpromise (can_read implies a strong contract that is hard-to-deliver for all the complexity of remote files).

Private files still can be accessed in a lot of cases. For example, a private S3 bucket read with `s3://` when AWS credentials are already configured in the environment (`AWS_PROFILE` or `~/.aws/credentials`), a `gs://` object when `GOOGLE_APPLICATION_CREDENTIALS` is set, or an `abfs://` path via Azure managed identity; fsspec picks up each backend's default credential chain automatically. 

That said, I did not want to make the signature more complex by adding login configuration parameters as that would be against the original spirit of this function. The original `read_nwb` design from #1974 was as simple as possible without config. Power-user scenarios (e.g. forced h5py ROS3 driver or custom S3-compatible endpoints) continue to require dropping to `NWBHDF5IO` or `NWBZarrIO` directly and I think this is where private access should be.

The remote-Zarr test depends on the `resolve_ref` self-reference fix for fsspec stores from , which I opened upstream. That fix is now released in hdmf-zarr 0.13.0, so no special pin is needed and the test runs against a normal `hdmf-zarr` install.

I am also fixing a pre-existing scheme bug in `NWBHDF5IO.read_nwb`'s streaming branch: the fsspec filesystem was hard-coded to `"http"` regardless of URL scheme, so `s3://`, `gs://`, and `abfs://` paths silently failed for non-HTTP backends.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72cceeba2e8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.