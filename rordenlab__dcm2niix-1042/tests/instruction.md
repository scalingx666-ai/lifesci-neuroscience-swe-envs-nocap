# Issue

**Title:** Heap-allocate TDTI4D in MRS/MRSI writers to avoid stack overflow

## Description

This is the `TDTI4D` stack-to-heap move that AGENTS.md lists as a standing opportunity, on its own. `saveDcm2NiiMRS` and `saveDcm2NiiMRSI` held three `struct TDTI4D` locals (8.36 MB each, 5.57 MB on Linux), and the first calls the second. MSVC gives every local its own slot: with the v1.0.20260724 Windows binary a Siemens XA Enhanced MR Spectroscopy CSI (36x36x23, 512 points) needs 24.64 MB of stack and a 65-file SVS series 16.45 MB (bisected by patching the PE stack reserve), so both end in 0xC00000FD at its 16,388,608 byte reserve. The three sites now call one helper, `mrsSaveBIDS` (malloc, `initTDTI4D`, `nii_SaveBIDSX`, free; warns and skips the sidecar if malloc fails).

Minimum stack for that CSI file, before -> after (`ulimit -s` bisect on Linux, PE reserve on Windows):
- gcc 13 `make`: 5.77 -> 1.14 MB; `make debug`: 11.30 -> 1.09 MB (segfault at the 8 MiB default before)
- clang 14 `-O3`: 11.38 -> 1.12 MB; with the non-Linux `kMaxSlice2D`: 16.94 -> 1.64 MB (16 MiB is 16.78 MB)
- mingw-w64 gcc 12, run on Windows: 16.92 -> 1.64 MB
- clang inlines the SVS writer into `saveDcm2Nii` (frame 8,421,240 -> 96,952 bytes), so a plain image series goes from 5.69 to 1.11 MB (8.47 to 1.64 MB with the non-Linux size)

What is left is the `readDICOMx` frame, so the stack gates are untouched.

Output is byte-identical before and after (md5 of every .nii and .json): `dcm_qa_mrs` `batch.py --corpus both` (80 files: SVS, `_mrsref` companions, Siemens and UIH MRSI), `dcm_qa`, `dcm_qa_nih` and `dcm_qa_uih` with gcc `make` builds, and CSI, SVS and image inputs with gcc, clang and mingw builds. `compare_spec2nii.py --corpus both` prints the same report before and after (local 2/2 pass; spec2nii corpus 17 pass, 13 fail, 10 skipped with spec2nii 0.8.15). On Linux gcc `batch.py` flags both local sidecars against Ref with and without this change (last digit of one `VOI` element). ASan+UBSan+LSan and valgrind are clean on MRSI, SVS and image inputs.

The second commit updates the matching stack note in AGENTS.md; it can be dropped if you prefer to word that yourself.

Not tested: MSVC, AppleClang and emcc builds of this branch.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5beba99a3fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.