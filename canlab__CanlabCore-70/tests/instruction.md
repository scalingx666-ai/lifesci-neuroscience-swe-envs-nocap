# Issue

**Title:** Fix deprecated avifile/addframe API and timeseries_extract_slice returning all zeros

## Description

`movie_tools` and `movie_of_slice_timeseries` used the removed `avifile()`/`addframe()` API. `timeseries_extract_slice` returned all zeros due to double `spm_vol` remapping and was missing sagittal/coronal implementations entirely.

## `timeseries_extract_slice.m`
- Replaced broken delegation chain (`get_ax_slice` → `spm_vol` → `spm_slice_vol`) with direct inline extraction using the `spm_matrix` + `spm_slice_vol` pattern from the working `timeseries4.m`
- Added sagittal and coronal slice extraction (previously referenced but undefined)
- Removed stale SPM version detection boilerplate

## `get_ax_slice.m`
- Replaced manual `eye(4)` + `C(3,4) = slice_num` with `spm_matrix([0 0 slice_num])`, consistent with `cluster_orthviews.m`
- Use `V(i).dim(1:2)` per-volume instead of pre-computed `V(1).dim(1:2)`

## `movie_of_slice_timeseries.m`
- `writeVideo(mov, H)` passed a raw axes handle — fixed to `writeVideo(mov, getframe(H))`
- `mov.Quality` was a bare property read (no-op) — fixed to `mov.Quality = 75`
- Updated unused `add_a_frame` helper to match

## `movie_tools.m`
- Replaced `avifile()`/`addframe()` with `VideoWriter`/`open`/`writeVideo`/`getframe` in the `'avi'` branch

```matlab
% Before
mov = avifile('mymovie.avi', 'Quality', 75, 'Compression', 'None', 'Fps', fps);
mov = addframe(mov, H);

% After
mov = VideoWriter('mymovie.avi');
mov.Quality = 75;
mov.FrameRate = fps;
open(mov);
frame = getframe(H);
writeVideo(mov, frame);
```

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>movie_tools and movie_of_slice_timeseries calls deprecated avifile() function. timeseries_extract_slice returns all 0s.</issue_title>
> <issue_description>movie_tools and movie_of_slice_timeseries are no longer functional because avifile() has been replaced by writeVideo().
> 
> timeseries_extract_slice, which is called in movie_of_slice_timeseries, returns all 0s.</issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes canlab/CanlabCore#57

<!-- START COPILOT CODING AGENT TIPS -->
---

💬 We'd love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a413f7b4ee1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.