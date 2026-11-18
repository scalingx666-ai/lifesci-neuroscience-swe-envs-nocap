# Issue

**Title:** Fix osfstorage zip_file path in Nieuwland2018Large._preproc_stimuli

## Description

## Fix osfstorage zip_file path in Nieuwland2018Large._preproc_stimuli

`nieuwland2018large.py:210` constructs:

```python
zip_file = path_download / "osfstorage" / "Stimuli" / "Stimuli.zip"
```

But `Osf._download()` saves files using `source.path` from osfclient, which never includes an `osfstorage` prefix. The file lands at `download/Stimuli/Stimuli.zip`, causing a `FileNotFoundError`.

### Reproduction

No dataset download needed. Only `pip install osfclient tqdm`:

```python
from pathlib import Path
from tqdm import tqdm
import osfclient

study = "eyzaq"
dl_dir = Path("/tmp/osf_debug_download")

project = osfclient.OSF().project(study)
store = list(project.storages)
storage_inds = [0]

# Mirror Osf._download() exactly (neuralfetch/download.py:1177-1198)
pbar = tqdm()
for ind in storage_inds:
    for source in store[ind].files:
        path = source.path
        if path.startswith("/"):
            path = path[1:]
        file_ = dl_dir / path
        if "Stimuli" in path:
            print(f"source.path (raw):     {source.path!r}")
            print(f"stripped path:          {path!r}")
            print(f"Download saves to:     {dl_dir}/{path}")
            print(f"Code expects file at:  {dl_dir}/osfstorage/{path}")
            print()
            print("=> 'osfstorage' prefix never appears in osfclient paths.")
            print("=> Bug: nieuwland2018large.py:210 adds a non-existent segment.")
            break
pbar.close()
```

**Output:**

```
source.path (raw):     '/Stimuli/Stimuli.zip'
stripped path:          'Stimuli/Stimuli.zip'
Download saves to:     /tmp/osf_debug_download/Stimuli/Stimuli.zip
Code expects file at:  /tmp/osf_debug_download/osfstorage/Stimuli/Stimuli.zip

=> 'osfstorage' prefix never appears in osfclient paths.
=> Bug: nieuwland2018large.py:210 adds a non-existent segment.
```

### Fix

Remove `osfstorage` from the path:

```python
zip_file = path_download / "Stimuli" / "Stimuli.zip"
```

---

**PS:** I'm encountering other bugs with this dataset's files being unable to run the example. I'll keep trying to debug and may submit follow-up PRs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d2f306df4d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.