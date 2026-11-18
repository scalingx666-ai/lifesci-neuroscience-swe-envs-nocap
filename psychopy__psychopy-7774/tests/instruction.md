# Issue

**Title:** BF: Update variousVisualStims demo to use MovieStim

## Description

Fixes one of the three demos listed in #7754 (`variousVisualStims.py`). You marked that issue
as a good first issue, so I hope this is the kind of thing you had in mind — happy to take the
other two as well if you'd like them in one go (notes below).

## The problem

```python
movie = visual.MovieStim3(win, 'jwpIntro.mp4', units='pix', pos=[100, 100], size=[160, 120])
```

`psychopy.visual` no longer has `MovieStim3` — `psychopy/visual/__init__.py` only exports
`MovieStim` — so the demo dies with
`AttributeError: module 'psychopy.visual' has no attribute 'MovieStim3'` on the first frame.

## The change

`MovieStim3` → `MovieStim`, nothing else. I checked that `MovieStim` actually covers what this
demo does:

- its `__init__` takes `win, filename, units, pos, size`, which is exactly what the demo passes
  (same argument order and names);
- the demo animates `movie.ori` later on, and `MovieStim` sets `self.ori` via `BaseVisualStim`,
  so that still works.

`jwpIntro.mp4` is still present in the demo folder, so the stimulus file is not missing.

I used the existing `MovieStim.py` demo in the same folder as the reference for current usage
rather than inventing anything.

## Not touched here (the other two from #7754)

- `soundStimuli.py` — uses `psychopy.sound.audioLib`, which no longer exists. I'd need to know
  what the intended replacement is (just reporting the backend name, or something else) before
  changing it.
- `testSoundLatency.py` — imports `labjack`. Per your comment on the issue this one needs to
  move out to the `psychopy-labjack` plugin and be added via an entry point, which is a
  different kind of change from this one.

Say the word if you'd rather I did either of those, or folded them into this PR.

## Validation

Source-level only, I'm afraid: I could not actually run the demo. There is no display available
here, and PsychoPy would not install in this environment (tried the normal install,
`--prefer-binary`, and `--no-build-isolation`; the last one fails building numpy from source
with no compiler available). So this rests on:

- `psychopy/visual/__init__.py` exports `MovieStim` and nothing called `MovieStim3`
- `MovieStim.__init__` signature accepts `win`, `filename`, `units`, `size`, `pos`
- `MovieStim` sets `self.ori`, so the demo's rotation still applies

If you can run it, the demo should now show the gabor, movie, text and face stimuli rotating
with mouse movement.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `602bfdee4529`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.