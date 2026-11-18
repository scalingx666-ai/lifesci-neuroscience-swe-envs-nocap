# Issue

**Title:** fix(kb): pack a rebind overlay's implementation, not just its manifest

## Description

## What breaks today

`_pack_overlay` carries the manifest, `sitecustomize.py`, and the `_patched/` tree. That is the
whole overlay only for a **patch-style** rebind, where the replacement module *is* the `_patched/`
copy.

A **`rebinds`** overlay leaves the upstream module alone and swaps one symbol for
`impl_module`'s. That module sits at the overlay **root**, not under `_patched/`, so nothing
matched it and the tarball shipped a manifest pointing at a file that was not in the archive.
Unpack it, put it on `PYTHONPATH`, and `sitecustomize.py` raises `ImportError` on the first line
that matters.

Measured on the DeepSeek-V4-Pro authored sparse-MLA decode win (2.311x isolated, +4.141% e2e):

```
$ git show origin/main:e2e_workflow/scripts/e2e_store.py   # _pack_overlay on the winning overlay
overlay/_overlay_manifest.json
overlay/sitecustomize.py
```

Two entries, both metadata. The 30 KB kernel, its seam, and the retuned prefill launcher were all
absent — the record promised a reproducible run and shipped nothing to reproduce it with.

## Why naming the manifest's module is not enough

That module is regularly a shim:

- GLM-5.2's `dsa_engage_c0_triton` is 1.6 KB of `from dsa_authored_c0_triton import
  tilelang_sparse_fwd` wrapping a 23 KB authored Triton kernel.
- gpt-oss-120b's `_fwd_kernel` win keeps its entire HIP source in `geak_hip_extend/`.

So `_overlay_modules` walks the **transitive closure** from each `rebinds[*].impl_module`, and
`_sibling_imports` reads that closure out of the source **text** with a regex rather than by
importing the module. Importing an overlay module on the write path would run its top level, which
for an authored kernel means compiling Triton against whatever GPU the writer happens to be
sitting on.

A name that resolves to nothing at the overlay root is an ordinary third-party import and is left
alone, so the closure terminates at the overlay boundary. A submodule rebind
(`geak_authored.gemm_flydsl`) is addressed by its top-level package, which is what sits at the
root. Names that are absolute or carry a path separator are refused rather than resolved into
somebody's filesystem.

## Second commit: the other entry point

Seeding the closure from the manifest alone left `sitecustomize.py` out. An overlay that captures
shapes or traces a seam does that work in siblings `sitecustomize.py` imports **directly**, with
no manifest entry naming them — the sparse-MLA capture overlays import `capture_shapes` and
`seam_trace`, and both were missing from the tarball while the hook that imports them was in it.
Both roots now seed the same walk.

The second commit also corrects a comment that claimed a dotted `impl_module` is refused. The code
splits on the first dot before that check, so it never was; what is actually refused is an
absolute or separator-bearing name.

## Verification

Swept `_pack_overlay` old-vs-new across the **42 overlay directories** of the `hl_matrix_0824`
matrix (31 `rebinds`, 11 patch-style):

| | |
|---|---|
| rebinds overlays incomplete under the current packer | **31 / 31** |
| files now carried that were previously dropped | **52** |
| overlays that lost a file (regression check `old ⊆ new`) | **0** |
| packed modules left importing a sibling absent from the archive | **0** |

The last row is an independent closure check — it re-derives each tarball's import graph from the
source and asserts every sibling-resolvable name is present, rather than trusting the packer's own
notion of the closure.

Representative gains: `overlay_c0_triton` 2 → 5 entries (`hl_sparse_decode.py`,
`hl_sparse_decode_seam.py`, `hl_prefill_ragged_tuned.py`); `overlay_c1_flydsl` picks up the whole
`geak_authored/` package; the llama-3.1-8B tuning overlays pick up `geak_fp8_rowwise.py`.

Tests: the three existing `_pack_overlay` tests still pass, plus five new ones covering the plain
rebind, the shim indirection, a submodule rebind, `sitecustomize.py`'s siblings, and the escape
refusal. **All four positive new tests fail against `origin/main`'s packer** (verified by swapping
the implementation under the test module).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1273601ad461`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.