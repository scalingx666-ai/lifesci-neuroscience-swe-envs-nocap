# Issue

**Title:** ENH: Speed up MapIcosahedron, fix tiny scaling bug, no data changes

## Description

## MapIcosahedron: make SUMA_MapSurface ~8x faster

MapIcosahedron spends most of its time in `SUMA_MapSurface`, finding the 3 closest
morph-sphere nodes for each icosahedron node. It did that by sorting nodes by x and
scanning a ±11 mm slab every time. That's ~15k nodes per lookup, or ~3 billion loop
iterations for `-ld 141`. Profiling put ~70% of total runtime in `SUMA_Search_Min_Dist`.

I swapped it for a uniform grid (cells ~2 node spacings wide) with an exact 3-nearest
search. It still gives the same answers, and ties break the same way as before. It just
does a lot less work.

### Stuff that got cleaned up along the way

No good deed: while verify code with **Claude Opus 5.5**, "we" stumbled upon
a few additional bugs / quirks / forgotten lunches. In the first pass were two
very minor things - neither of these was hurting anyone in practice, fixed now:

- The slab-widening retry loop checked `k` instead of `seg[1]`, so it could in theory
  step past the end of the node array. It only runs when the first pass finds fewer
  than 3 nodes, which basically doesn't happen on a normal FreeSurfer sphere. The loop
  doesn't exist anymore, so neither does the bug.
- `avgDist` was area per node (mm²), not a distance. At radius 100 those come out to
  about the same number, so nobody noticed. It's now `sqrt()`'d, so the search size
  actually scales with the sphere.

I gave the new search a second, more paranoid pass and tightened up a few edge cases
(commits 2 & 3). None of them can happen with a real sphere, but now they can't happen
at all:

- **Float rounding at cell borders.** Nodes get filed into cells with float math, but
  the "can I stop searching yet?" check treated cell borders as exact. A node within
  ~1e-5 mm of a border could, in theory, be skipped. The stopping check now leaves room
  for that rounding, and filing and lookup share one function so they can't disagree.
- **Cell count overflow.** The cell count was a plain `int` product, so a silly-small
  cell size could overflow it before the size cap kicked in. It's counted in double now.
- **NaN/inf coordinates** went through an `(int)` cast, which is undefined behavior in
  C. They now just land in cell 0 and fail the usual way further down.
- With `-sphere_at_origin` or `-sphere_center`, MapIcosahedron never initializes its
  `snote` buffer before `strcat`ing onto it. That puts random stack bytes into the
  `.MI.1D` header (and could in theory overrun the 1000-byte buffer). The data rows were
  always fine. This one's old and lives in `SUMA_MapIcosahedron.c`, but it's a 3-line
  fix, so it's in here: the buffer starts empty, the user-center path writes a real note
  ("Used user-specified center of [...]"), and the appends are length-limited.

### Output

Identical. I diffed the `.MI.1D` node map and every output surface, old vs new
(ignoring `#` header lines).

| Test                                                       | Old `SUMA_MapSurface` | New    | Output                  |
| ---------------------------------------------------------- | --------------------- | ------ | ----------------------- |
| cvs_avg35 lh, `-ld 141`, 3 surfaces                        | 7.6 s                 | 0.93 s | identical (all 4 files) |
| same, `-ld 60`                                             | 1.35 s                | 0.18 s | identical (all 4 files) |
| fsaverage sphere (regular icosahedron, lots of exact ties) | 6.6 s                 | 0.73 s | identical               |

The whole `-ld 141` run goes from 10.1 s to 3.1 s. `@SUMA_Make_Spec_FS` runs this
4 times per subject (2 hemis × ld 141/60), so the savings add up.

### Sphere radius doesn't matter anymore

Because of the `avgDist` thing, old runtime depended on sphere size. I scaled the same
sphere to r=10 and r=1000. Times are for the whole run:

| Radius | Old       | New   | Old vs new                                                             |
| ------ | --------- | ----- | ---------------------------------------------------------------------- |
| 10     | 3.0 s     | 2.5 s | 2/198,812 rows differ in the 6th decimal of one weight; same triangles |
| 100    | 9.2 s     | 2.5 s | identical                                                              |
| 1000   | **110 s** | 2.5 s | identical                                                              |

### Real subject (`@SUMA_Make_Spec_FS -GIFTI` output, FS 8.2)

I reran the 4 MapIcosahedron calls that `@SUMA_Make_Spec_FS` makes (lh/rh × ld 141/60,
with the thickness/curv/sulc `-dset_map`s). Comparing the numbers in every output
(GIFTI arrays, NIML dsets, M2M, MI.1D, spec), old vs new is **56/56 files identical**.
I also planted some 1e-6-sized edits to make sure the compare actually catches stuff.
It does.

Timed one run at a time:

| Call            | Old `SUMA_MapSurface` | New       | Old whole run | New whole run |
| --------------- | --------------------- | --------- | ------------- | ------------- |
| lh `-ld 141`    | 6.80 s                | 0.79 s    | 13.4 s        | 7.3 s         |
| rh `-ld 141`    | 6.65 s                | 0.76 s    | 13.2 s        | 7.1 s         |
| lh `-ld 60`     | 1.27 s                | 0.16 s    | 3.4 s         | 2.3 s         |
| rh `-ld 60`     | 1.24 s                | 0.16 s    | 3.4 s         | 2.4 s         |
| **per subject** | **16.0 s**            | **1.9 s** | **33.3 s**    | **19.1 s**    |

FYI: a gcc build of the _old_ code gives slightly different weights than clang does
(≤5e-5, with the same triangles picked everywhere). That's just compiler float noise
and has nothing to do with this change. Same compiler, before vs after, it's bit-for-bit.

### Testing

This is a pretty central piece of the surface pipeline, so I went a bit overboard:

- **Before vs after, same tree and compiler:** I built the pre-patch commit and this
  branch side by side and ran 18 cases: 6 spheres (cvs_avg35 lh/rh + MNI, fsaverage,
  one real subject lh/rh), `-ld 20/60/141/200`, `-rd 6`, `-use_com`,
  `-sphere_at_origin`, `-dset_map` + `-NN_dset_map`, `-write_dist`, and full
  multi-surface specs. **103/103 output files numerically identical.**
- **Brute force:** Claude  pulled the grid code out of the source file and checked 
   it against a dumb "measure every node" search.
  - Every icosahedron point (ld 141 and 60) on all 6 real spheres, 1.4M queries:
    0 mismatches.
  - 90k nasty synthetic queries (exact ties, nodes sitting on cell borders, flat/line/
    duplicate meshes, N=1–4, huge coordinates, NaN/inf): 0 mismatches, run under
    AddressSanitizer/UBSan with nothing flagged.
- Touched `src/SUMA/SUMA_SphericalMapping.c` (the search) and
  `src/SUMA/SUMA_MapIcosahedron.c` (the `snote` fix only). `SUMA_Search_Min_Dist` is
  still in the library in case anything outside the tree uses it, but nothing calls it now.


---

## Amendment: `-classic`, an old-vs-new test script, and two more `MapIcosahedron` fixes

### `-classic`: run the old search on demand

`MapIcosahedron -classic` runs the original slab search, so anyone can compare old and
new on their own data with one binary. It brings back the old `avgDist` (area per
node, not its `sqrt()`) along with the slab search, because the slab width depends on
it. That way `-classic` reproduces the old output exactly, scaling quirk and all.

Two corrections to the description above:

- The slab-widening retry loop is back, but only behind `-classic`, as the static
  helper `SUMA_SlabSearch_3NN()`. Its out-of-bounds step is now capped at the last
  node. Output only differs where the old code would have read past the array.
- `SUMA_Search_Min_Dist` is called again, by `-classic`.

`SUMA_MapSurface()` gained an `int classic` argument (header updated). Its only caller
is `MapIcosahedron`.

### Test script: `src/src_notes/test_00_MapIcosahedron.tcsh`

This follows the other `test_*` scripts in `src_notes`. It works on any FreeSurfer
subject with a `SUMA/` folder from `@SUMA_Make_Spec_FS`, and defaults to `./fsaverage`:

    tcsh test_00_MapIcosahedron.tcsh [SUBJ_DIR [SID]]

It runs each hemisphere at `-ld 60`, `-ld 141` and `-rd 7`, three ways each: old
binary, new binary, and new binary with `-classic`. It then compares new and classic
against old:

- `MI.1D` node indices and weights (`3dDiff`)
- every std-mesh surface (`gifti_tool -compare_data`)
- every mapped dataset (`3dDiff`)

It also reports total wall time and the `SUMA_MapSurface` time from `-verb`. If the
spec files are missing, it prints copy-paste prep commands. The numbers below are also
in the script's header comments.

fsaverage, old = AFNI_26.2.03 precompiled binary, new = this branch built with
gcc-15 `-O1`:

| Mesh      | `SUMA_MapSurface` old / new / classic | Whole run old / new / classic |
| --------- | ------------------------------------- | ----------------------------- |
| `-ld 60`  | 2.40 / 0.17 / 1.86 s                  | 4.5 / 2.2 / 3.9 s             |
| `-ld 141` | 10.69 / 0.83 / 8.21 s                 | 16.3 / 6.6 / 13.9 s           |
| `-rd 7`   | 8.07 / 0.64 / 6.02 s                  | 18.1 / 10.5 / 16.1 s          |

All 12 tests (fsaverage plus one real subject, lh and rh) gave identical node maps,
surfaces (7 per test) and mapped datasets for new and classic against old.

**Why is classic faster than old?** It's the build, not the code. I built the
pre-patch source with the same compiler and flags as the new binary and timed all
three on fsaverage lh `-ld 141` (3 runs each). All three node maps were byte-identical:

| Binary                         | `SUMA_MapSurface` |
| ------------------------------ | ----------------- |
| old, precompiled AFNI_26.2.03  | 10.7–11.3 s       |
| old source, built like new     | 8.6–9.1 s         |
| new with `-classic`            | 8.1–9.0 s         |

### Real subject, through `@SUMA_Make_Spec_FS -GIFTI`

I ran the whole script twice on the same subject: once with the new `MapIcosahedron`
and once with a wrapper that adds `-classic` (ld 141 and 60, both hemispheres).

- All 130 output files had the same data.
- Standard-mesh surfaces were identical at full precision. `.niml.M2M` files and mapped
  datasets were byte-identical. `MI.1D` and spec files differed only in their History
  line.
- `MapIcosahedron` took about 8 s per hemisphere at `-ld 141` with the new search,
  vs. about 16 s with `-classic`.

### Two more fixes in `SUMA_MapIcosahedron.c`

Both are old bugs that turned up while writing the test script.

- **`MI.1D` header had an uncommented line.** The sphere-center notice in `snote` ended
  in `\n`, so the radius note got appended on its own line, and that line was written
  without its `#`:

      # Notice: Used geom. center of [...] for lh.sphere.reg.gii. COM was [...].
       Using average radius of 100.0000

  AFNI's 1D reader rejects the whole file because of it (`3dDiff`, `1dcat`: "Failed
  parsing data row 0"). The note is now one comment line. Checked with the default
  center, `-use_com`, `-sphere_center` and `-sphere_radius`.
- **`-prefix` with a folder.** Output names were built as `<input path><prefix><name>`,
  and the input path is `./` (MapIcosahedron has to run in the spec's folder), so:
  - **Absolute prefix:** it became `.//abs/path/...` and no surfaces or datasets were
    written. (The `.MI.1D` and `.M2M` files were still written, since they're named
    from the prefix alone.) A new helper, `SUMA_MI_OutPath()`, skips the input path
    when the prefix is absolute.
  - **Any prefix with a folder, relative or absolute:** the std spec listed paths
    relative to where MapIcosahedron ran, but SUMA reads spec entries relative to the
    spec file, so the spec wouldn't load (`SurfInfo`: "Failed to find surface"). Once
    all outputs are written, `SUMA_MI_SpecRelative()` rewrites the entries relative to
    the spec.
  - Absolute and relative-folder prefixes now give identical outputs, and both specs
    load from anywhere. A plain prefix like `std.60.` (what `@SUMA_Make_Spec_FS` uses)
    produces the same spec as before.

Known, not fixed here: `MapIcosahedron` still exits 0 when writing a surface fails.
The test script works around it by checking that the `.gii` files exist.

### Files touched (updated)

- `src/SUMA/SUMA_SphericalMapping.c`, `.h`: the grid search, plus the `-classic` path
  (`SUMA_SlabSearch_3NN`, `classic` argument)
- `src/SUMA/SUMA_MapIcosahedron.c`: the `snote` fixes, the `-classic` option and help,
  the `-prefix` fix
- `src/src_notes/test_00_MapIcosahedron.py`: new

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28d5a260c975`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.