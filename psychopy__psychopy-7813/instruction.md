# Issue

**Title:** BF: fix Vertices.setas() not being the inverse of getas()

## Description

`Vertices.getas(units)` converts an object's normalised base vertices to absolute coordinates in four steps: multiply by size, multiply by flip, add `anchorAdjust * size`, add pos. `setas(value, units)` is supposed to be the inverse of that, but it applied the same four steps in the same order instead of reversing them, so it only produced the correct base vertices when pos is `(0, 0)` and anchor is centre, because with those two the pos and anchor terms drop out and the size/flip steps happen to be self-cancelling regardless of size.

```python
# getas (unchanged)
verts *= getattr(self.size, units)
verts *= self._flip
verts += self.anchorAdjust * getattr(self.size, units)
verts += getattr(self.pos, units)

# setas, before this change (same order, not reversed)
value /= getattr(self.size, units)
value *= self._flip
value -= self.anchorAdjust * getattr(self.size, units)
value -= getattr(self.pos, units)
```

This affects anyone using `TextBox2.speechPoint` on a box that isn't centred at `(0, 0)`, since the speech-bubble tail vertex is computed by feeding the user's point through `Vertices.setas()` (`psychopy/visual/textbox2/textbox2.py`, `speechPoint` setter, around line 556). It's also reachable directly through the `Vertices.pix`, `.deg`, `.cm`, `.norm` and `.height` setters, which all call `setas()` internally. In practice the tail point is computed from garbage coordinates and can be drawn far off screen.

Reproduction:

```python
import numpy as np
from psychopy import layout
size = layout.Size([200, 100], 'pix')
pos = layout.Position([300, 0], 'pix')
base = np.array([[0.5, -0.5], [-0.5, -0.5], [-0.5, 0.5], [0.5, 0.5]])
v = layout.Vertices(base, size=size, pos=pos, units='pix')
absPix = v.getas('pix')
v2 = layout.Vertices(base, size=size, pos=pos, units='pix')
v2.setas(absPix, 'pix')
print(v2.base.tolist())
```

On `release`, `setas(getas(base))` does not recover `base`:

```
[[-298.0, -0.5], [-299.0, -0.5], [-299.0, 0.5], [-298.0, 0.5]]
```

instead of the original `[[0.5, -0.5], [-0.5, -0.5], [-0.5, 0.5], [0.5, 0.5]]`. With this fix the same call reproduces the original `base` array exactly.

The existing test for this feature, `test_speechpoint` in `psychopy/tests/test_visual/test_textbox.py` (added in #5381), only exercises a TextBox2 at the default position `(0, 0)` with centre anchor, which is the one case where the broken and correct formulas happen to agree, so it never caught this.

Added `TestVertices.test_setas_inverts_getas` to `psychopy/tests/test_misc/test_layout.py`, which builds a `Vertices` object with a non-zero pos and non-unit size, round-trips a known absolute-pixel array through `getas`/`setas`, and checks the base vertices come back unchanged. It fails on `release` and passes with this fix.

Ran `xvfb-run -a dbus-run-session python -m pytest psychopy/tests/test_misc/test_layout.py psychopy/tests/test_visual/test_shape.py psychopy/tests/test_visual/test_textbox.py::Test_textbox::test_speechpoint` twice: 14 passed with the fix versus 13 on `release`, and `test_speechpoint` itself is unaffected either way since it only covers the centred case that the old code happened to get right.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f24617e83a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.