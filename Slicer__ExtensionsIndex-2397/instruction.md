# Issue

**Title:** Add OMEZarr extension

## Description

# New extension

OMEZarr opens and saves OME-Zarr (OME-NGFF) images in Slicer: drop a local
`.ome.zarr` folder or paste an `https://` / `s3://` address. Large images open
at a resolution that fits in memory, and the slice views can then be refined
to full resolution, reading only the chunks they need. It is built on
[ngff-zarr](https://github.com/fideus-labs/ngff-zarr), which it installs from
PyPI on first use.

Repository: https://github.com/fideus-labs/SlicerOMEZarr

The module self-test runs in GitHub Actions against the latest stable Slicer
on Linux, macOS and Windows.

## Tier 1

- [x] Extension has a reasonable name
- [x] Repository name is Slicer+ExtensionName
- [x] Repository is associated with `3d-slicer-extension` GitHub topic
- [x] Extension description summarizes in 1-2 sentences what the extension is usable for
- [x] Any known related patents must be mentioned in the extension description (none)
- [x] LICENSE is present in the repository root (MIT) and the license is named on the homepage
- [x] Extension URL and revision are correct (`main` branch)
- [x] Extension icon URL is correct
- [x] Screenshot URLs are correct, contains at least one
- [x] Content of submitted json file is consistent with the top-level CMakeLists.txt
- Homepage URL points to valid webpage containing the following:
  - [x] Extension name
  - [x] Short description
  - [x] At least one nice, informative image (a walkthrough video and screenshots)
  - [x] Description of contained modules
  - [x] Publication: none yet
- Hide unused github features:
  - [x] Wiki, Projects and Discussions are disabled
  - [x] Releases and Packages are unchecked in About
- The extension is safe:
  - [x] Does not include or download binaries from unreliable sources
  - [x] Does not send any information anywhere without user consent

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b346b2a7c770`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.