# Issue

**Title:** BF: Fix AttributeError in MovieStim.stop and unload

## Description

### Description of changes

This fixes an `AttributeError` when calling `MovieStim.stop()`, `MovieStim.unload()`, or when re-loading a movie file (#7793).

#### Problem
In `MovieStim.unload()`, `self._freePlayer()` was called to clean up the movie player. However, `_freePlayer()` was only defined on the underlying `MovieFileReader` class, not on `MovieStim` itself. When `video.stop()` ran, it called `self.loadMovie()` which invoked `self.unload()`, resulting in:
```
  File "psychopy/visual/movies/__init__.py", line 2188, in stop
    self.loadMovie(self._filename)  # reload the movie
  File "psychopy/visual/movies/__init__.py", line 1464, in loadMovie
    self.unload()
  File "psychopy/visual/movies/__init__.py", line 1678, in unload
    self._freePlayer()  # free the player if it is already open
AttributeError: 'MovieStim' object has no attribute '_freePlayer'. Did you mean: '_hasPlayer'?
```

#### Solution
1. **Implement `MovieStim._freePlayer()`**: Safely closes `self._player` (if open) and clears `self._player = None`.
2. **Update `MovieStim.unload()`**: Ensures `_cleanupAudioTrack()` is called and guards against early teardown (`getattr(self, '_isLoaded', False)`).
3. **Streamline `MovieStim.stop()`**: Calls `self.unload()` before reloading via `self.loadMovie()` to ensure textures, audio, and player handles are properly torn down and recreated.
4. **Early attribute initialization**: Defines `self._player = None` and `self._isLoaded = False` before `super().__init__` to prevent secondary exceptions if garbage collected on failed initialization.
5. **Unit test**: Added `test_moviestim_stop_and_unload` in `psychopy/tests/test_visual/test_movies.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ee7b7f8b8a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.