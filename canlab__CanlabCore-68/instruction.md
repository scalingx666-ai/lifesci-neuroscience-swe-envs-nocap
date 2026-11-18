# Issue

**Title:** Fix reshape error in render_blobs when cmaprange min equals max

## Description

When using a custom colormap and `cmaprange(1) == cmaprange(2)`, `map_function` returned a scalar instead of an array matching the shape of the input `Z`, causing a fatal reshape mismatch on `cm(round(w),:)`.

## Changes

- **`map_function`:** Multiply the constant mid-range value by `ones(size(c))` so the output always matches the shape of the input, regardless of the `x1 == x2` branch:
  ```matlab
  % Before
  range_val = (y2-y1)/2;
  % After
  range_val = (y2-y1)/2 * ones(size(c));
  ```

- **`customcolormap` branch:** Add `w(isnan(w)) = 1` after `map_function` to clamp NaN values in `w` (which arise from NaN entries in `Z` produced by out-of-range `interp2` results) before they are used as array indices into `cm`.

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>error on render_blobs</issue_title>
> <issue_description>Hi,
> I get the following error after running  z_batch_publish_analyses('contrasts'), it doesn't happen with older version but since late 2024 after update:
>
> Error using reshape
> Number of elements must not change. Use [] as one of the size inputs to automatically calculate the appropriate size for that dimension.
>
> Error in render_blobs (line 645)
>                         slicecdat = reshape(cm(round(w),:),[size(Z),3]);
>
> Error in fmridisplay/addblobs (line 378)
>     [blobhan, cmaprange, mincolor, maxcolor] = render_blobs(currentmap, obj.montage{i}, obj.SPACE, varargin{:});
>
> Error in region/montage (line 394)
>                 o2 = addblobs(o2, obj(i), varargin{:}, 'wh_montages', i, 'noverbose');
>
> Error in c_univariate_contrast_maps (line 89)
>         o3 = montage(r, 'colormap', 'regioncenters');
>
> Error in run (line 91)
> evalin('caller', strcat(script, ';'));
>
> Error in z_batch_coverage_and_contrasts (line 28)
> run(scriptname); % Run from master script, not local script. This script should not need to be edited for individual studies.
>
>
> Thanks </issue_description>
>
> <agent_instructions>Try to find the source of the error.</agent_instructions>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes canlab/CanlabCore#65

<!-- START COPILOT CODING AGENT TIPS -->
---

🔒 GitHub Advanced Security automatically protects Copilot coding agent pull requests. You can protect all pull requests by enabling Advanced Security for your repositories. [Learn more about Advanced Security.](https://gh.io/cca-advanced-security)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f5ba984ccbd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.