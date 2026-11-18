# Issue

**Title:** Read zarr v2 NWB files with zarr-python 3

## Description

This PR ensures that we can read NWB zarr files in the zarr v2 format, written by hdmf-zarr<0.14, as we move forward to zarr-python 3. The problem currently is that zarr-python 3 cannot parse some of the arrays in these old files (variable-length string columns with an integer fill value, for example), so opening them fails.

What this PR does is use the backward compatibility of the pynwb reader to handle the old files: hdmf-zarr reads them with `NWBZarrV2IO`. That way, our in-house zarr reader remains simpler, since it only needs to support zarr v3. The format is detected from the root metadata file (`zarr.json` or `.zgroup`) without opening the folder, both for local files and for files streamed with `stream_mode="zarr"`, and v2 files are routed to pynwb with a warning, since it can be slower. `NWBZarrV2IO` is called with `allow_pickle=True` because hdmf-zarr<0.14 pickled object references, such as the `group` column of the electrodes table, so most of these files cannot be read without it. Since hdmf-zarr 0.14 requires Python 3.12, reading v2 files with zarr-python 3 needs Python 3.12 or newer; on Python 3.11 the in-house reader still reads v3 files.

This is a different approach from #4260, which adds zarr v3 support and still reads v2 files with our in-house reader, working around zarr-python 3: it lists the store directly and skips the children that cannot be parsed. With this PR, those workarounds are no longer needed.

I went with the simplest way to unblock reading these files. If users of the old datasets need faster reading, we can add backward support to the in-house reader later, backed by a benchmark that shows the gain is worth the extra code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d2c4e669f99`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.