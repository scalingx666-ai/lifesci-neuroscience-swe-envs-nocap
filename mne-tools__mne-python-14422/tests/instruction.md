# Issue

**Title:** ENH: Paginate components and add temporal sliders for ICA sources in reports

## Description

Follow-up to

-  and
-
- (see also )

... to cover the remaining features I had envisioned when opening:

-

Gemini 4 Argon High helped with writing the code and the below decription:

## Summary

Enhances ICA source timecourse visualization in `mne.Report.add_ica(..., plot_sources=True)` (`Report._add_ica_sources`) in a backward-compatible, opt-in manner, structured into 5 atomic commits:

1. **Clean Snapshot Presentation (`4119ada30`):**
   - Pass `show_scrollbars=False` to `ica.plot_sources` so static report snapshots do not contain non-functional GUI scrollbars and buttons.
   - Temporarily hide annotations on `BaseRaw` instances inside a `try...finally` block while capturing source snapshots (restoring original annotations afterward) so full-height shaded annotation overlays do not occlude the ICA traces.

2. **Component Pagination (`d0d2c59d2`):**
   - Resolve component indices via `_picks_to_idx` and chunk them into blocks of up to `n_components` (default: `20`), while accounting for any auxiliary EOG/ECG channels appended to the viewport so reference traces are not clipped.
   - When all components fit in a single chunk (≤ 20 ICs), retain the `"Sources"` title for backward compatibility.
   - When more than `n_components` are present, paginate them into distinct cards titled `"Sources (ICs 0–19)"`, `"Sources (ICs 20–39)"`, etc., preventing components ≥ 20 from being truncated in high-density recordings.

3. **Opt-In Multi-Segment Temporal Slider & Pre-Slicing Optimization (`3ec5b3721`):**
   - Add `source_segments=None` and `source_duration=20.0` to `Report.add_ica`.
   - Pre-slice the requested time windows from `BaseRaw` instances and pre-compute segment ICA sources once upfront, avoiding full-recording matrix projections across every component chunk.
   - When `source_segments` is `None` or `1` (or the recording is shorter than `source_duration`), render a single static snapshot via `_add_figure` (preserving default behavior).
   - When `source_segments > 1` on a `BaseRaw` recording longer than `source_duration`, sample evenly spaced time windows across the interior of the recording (`np.linspace(..., source_segments + 2)[1:-1]`), update the browser figure in-place across each window, and register the snapshots as an interactive HTML5 slider via `_add_slider`.

4. **Documentation Tutorial (`2e9ac2056`):**
   - Demonstrate `source_segments=3, source_duration=5.0` alongside `plot_sources=True` in `tutorials/intro/70_report.py`.

5. **Changelog (`29c6873c7`):**
   - Add `doc/changes/dev/14422.newfeature.rst`.

---

## Before vs. After (25 ICA Components + 1 EOG Channel, with Annotations)

### Before (`upstream/main`)
- Components 20–24 and `EOG 061` are truncated/clipped outside the 20-row viewport.
- Non-functional GUI scrollbars and `Help` button are rasterized into the static image.
- Raw annotations draw full-height shaded overlays across the ICA traces.
- Only the initial `0–20 s` window is shown with no temporal scrubbing.

![Before (upstream/main)](https://raw.githubusercontent.com/sappelhoff/mne-python/pr-assets/ica-sources-viz/before.png)

### After (this PR, `source_segments=5`)
- Components are paginated into `Sources (ICs 0–19)` and `Sources (ICs 20–24)`, with `EOG 061` visible at the bottom of each card.
- Scrollbars and annotation overlays are hidden for clean trace inspection.
- Interactive HTML5 slider scrubs across 5 evenly-spaced 20-second segments across the recording.

![After (this PR)](https://raw.githubusercontent.com/sappelhoff/mne-python/pr-assets/ica-sources-viz/after.png)

---

## AI Disclosure
AI assistance (OpenCode / Gemini) was used to draft the implementation, unit tests, and documentation updates based on our reference implementation, reviewed and verified locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f498626a537`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.