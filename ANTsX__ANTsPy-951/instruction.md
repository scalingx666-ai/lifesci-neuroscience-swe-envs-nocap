# Issue

**Title:** BUG: reorient_image2 silently uses RIP for invalid codes

## Description

`reorient_image2` returns an RIP image, without an error, for any orientation string that isn't one of the 48 upper-case codes:

```python
import ants

mni = ants.image_read(ants.get_data("mni"))
for code in ["RAS", "ras", "Ras", "XYZ"]:
    print(code, ants.get_orientation(mni.reorient_image2(code)))
# RAS RAS
# ras RIP
# Ras RIP
# XYZ RIP
```

`reorientImage2.cxx` compares the string against each code in an `if / else if` chain with no final `else`. An unmatched string leaves `itk::OrientImageFilter` at its default desired orientation, which is RIP.
- `image_read(filename, reorient="lpi")` passes the string straight through, so it does the same.
- So does `plot_ortho_stack(..., reorient="lpi")`.
- So does a multichannel image.

This upper-cases the code and raises a `ValueError` if it isn't in `get_possible_orientations()`, before calling the library.
- That list and the C++ chain have the same 48 codes.
- Upper-case codes give the same output as before.
- The docstring now lists the argument.

Two other things now raise a `ValueError`:
- **Non-strings** such as `None`. Before, these raised a `TypeError` from nanobind.
- **Codes that `get_orientation` returns for oblique images.** For strongly oblique directions it can return a code that isn't in the list, e.g. `'RLA'`. Passing that back to `reorient_image2` used to give RIP.

`test_reorient_image_orientation_codes` checks that:
- every code gives that orientation, in upper and lower case;
- `'XYZ'`, `'RA'`, `'RRR'`, `''` and `None` raise;
- `image_read(..., reorient='lpi')` gives LPI.

It fails on `main` and passes here. On `main`, every lower-case code comes back as RIP, so 47 of the 48 lower-case checks fail; `'rip'` passes only because RIP is what it asked for. The invalid strings don't raise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d8907d1431f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.