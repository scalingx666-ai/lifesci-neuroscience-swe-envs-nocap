# Issue

**Title:** RF: replace remaining bare except clauses (round 2)

## Description

## Summary

 and #7605, which together aimed to make the codebase bare-except-free (per #7605's closing note). A `git grep` for literal bare `except:` on current `dev` turned up 7 that still exist -- either missed by that sweep, or introduced afterward:

| File | Note |
|---|---|
| `building/searchCopyrightYear.py` | never covered by any prior sweep |
| `psychopy/preferences/preferences.py` (`import psychopy_app`) | #7605 touched this file but only fixed a *different* bare except in it |
| `psychopy/sound/sound.py` | never covered |
| `psychopy/hardware/microphone/__init__.py` | never covered (likely reintroduced when this went from a single file to a package, after #7600 fixed the old `microphone.py`) |
| `psychopy/hardware/speaker/__init__.py` | same as above, for `speaker.py` |
| `psychopy/tools/gltools.py` | never covered |
| `psychopy/tools/fontmanager.py` (the `expanduser()` one) | #7605 touched this file but only fixed a *different* bare except in it |

Note #7617 is an independent PR covering some of this same ground (opened in the gap between #7600 and #7604/#7605 landing), but it's now stale/conflicting with already-merged work, and doesn't cover 3 of these 7 (the three `resolveBackend()` copies below). Left a comment there pointing here.

## Approach

Rather than a blanket `except Exception:` for all 7 (the pattern used in #7600/#7604/#7605/#7617), narrowed to a specific type wherever the actual failure mode is unambiguous:

- `searchCopyrightYear.py`: guards a `list.index()` lookup -> `except ValueError`
- `preferences.py`: guards an optional import -> `except ImportError`
- `sound.py` / `hardware/microphone/__init__.py` / `hardware/speaker/__init__.py`: three identical copies of the same `resolveBackend()` classmethod, guarding a `[...][0]` on a possibly-empty list -> `except IndexError`

Left as `except Exception:` where narrowing would mean guessing:
- `gltools.py`: guards an OpenGL query when no context may be bound; on this machine it actually succeeds, so I can't empirically confirm what fires when it doesn't (could be a GL-binding-specific error, `AttributeError`, `TypeError`, etc. depending on platform)
- `fontmanager.py`: guards `Path.expanduser()`; the one documented failure is `RuntimeError` (can't determine home dir), but `os.path.expanduser` can raise other things depending on platform

## Test plan

- [x] `git grep -n "^\s*except:\s*$" -- '*.py'` returns nothing on this branch (zero bare excepts left in the tree)
- [x] All 7 edited files still parse and import cleanly
- [x] Manually exercised `resolveBackend()` on `Sound`, `MicrophoneDevice`, `SpeakerDevice`: happy path (valid backend list) resolves correctly, and the `except IndexError` fallback path (list of only invalid backend names) still engages and falls through to the intended `ModuleNotFoundError` exactly as before
- [x] Manually exercised `FontFinder.getFolderFontFiles()` and `gltools.MAX_TEXTURE_UNITS` -- both work
- [x] `psychopy/tests/test_preferences` passes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84a5b87d6db6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.