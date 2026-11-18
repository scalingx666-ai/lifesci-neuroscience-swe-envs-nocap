# Issue

**Title:** Fix write() extreme slowdown for filenames containing underscores

## Description

Writing NIfTI files via `write()` was up to 1000x slower for filenames like `TYPEB_FITHRF.nii` vs `TYPEBFITHRF.nii` — after 3 minutes, only 39.7 MB of a 13.9 GB file had been written.

**Root cause:** `str2num` in `make_img_filename` uses `eval` internally. For non-numeric identifiers, `eval('[TYPEB_FITHRF]')` triggers a full MATLAB path search. On clusters with large, NFS-mounted MATLAB paths, this lookup is expensive and happens once per volume written.

## Changes

- **`str2num` → `str2double`** in `make_img_filename` (both `iimg_reconstruct_vols.m` and `iimg_reconstruct_3dvol.m`): `str2double` never invokes `eval` — non-numeric strings return `NaN` instantly with no path search. Added `isnan` fallback to preserve existing behavior.

  ```matlab
  % Before: triggers eval('[<identifier>]') → full MATLAB path search
  n = str2num(n1);

  % After: direct numeric parse, NaN for non-numeric, no path lookup
  n = str2double(n1);
  if isnan(n)
      n = imagenum;
  end
  ```

- **Fix `warning('off')` → `warning('off', 'all')` with save/restore** in both files: the bare `warning('off')` is deprecated since MATLAB R2020a and may silently fail to suppress warnings, causing per-volume warning output during large writes.

  ```matlab
  % Before
  warning('off');
  % ...
  warning('on');

  % After
  warnstate = warning('off', 'all');
  % ...
  warning(warnstate);
  ```

- **Fix O(N²) `char` concatenation** in slice write path (`iimg_reconstruct_vols.m`): replaced the growing char array built row-by-row in a loop with a pre-allocated cell array converted via `char()` at the end.

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>Write function very slow for certain filenames containing "_" but very fast without it.</issue_title>
> <issue_description>I encountered a very weird issue while using the toolbox on Ubuntu (but presumably this is also the reason why it takes so long to write stuff on our cluster).
>
> When I am trying write to a .nii file using the `write()` function I get very different writing speeds depending on the name of the file everything else being the same.
>
> **Base code**
>
> ```
> data = nifti_data_obj;
> data.dat = modelmd;
> data.fullpath = file_name;
> write(data,'overwrite');
> ```
>
> If the file name is `test.nii`, `test_test.nii` or even `TYPEBFITHRF.nii` , it is very fast (01 minutes, 01.632 seconds). However if I use the name `TYPEB_FITHRF.nii` it takes so long to write the 13.9 GB file that in the testing process I never finished it. To give you an idea how slow: After 3 minutes, `TYPEB_FITHRF.nii` is still only **39.7 MB** in file size.
>
> Unfortunately I am not very versed in MATLAB so I have no idea what's going on. </issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes canlab/CanlabCore#67

<!-- START COPILOT CODING AGENT TIPS -->
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f5ba984ccbd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.