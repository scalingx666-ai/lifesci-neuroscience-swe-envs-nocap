# Issue

**Title:** Add wasm jpegls and j2k/htj2k support

## Description

This PR enables WASM builds of dcm2niix that have support for both jpegls and j2k/htj2k using an emscripten build of openjpeg.

An environment manager [pixi](https://prefix.dev/), has been added to support the WASM build workflow across platforms (macOS/Linux). Note that on macOS-arm64 emscripten must still be installed/managed outside of pixi. Use a tool like homebrew to install it. 

Here's the dcm2niix version string, printed to the browser console, where it reports the compiled jpeg support:

```
Chris Rorden's dcm2niiX version v1.0.20241231  (JP2:OpenJPEG) (JP-LS:CharLS) Clang20.0.0  (32-bit Windows)
```

The WASM output files with jpeg support are roughly 1.8x the size of the base dcm2niix WASM build (a difference of 397K)

```
-rwxr-xr-x  1 taylor  staff   879K 19 Jan 21:52 dcm2niix.jpeg.wasm
-rwxr-xr-x  1 taylor  staff   482K 19 Jan 21:52 dcm2niix.wasm
```
This size increase seems to track well with other browser implementations such as `@cornerstonejs/codec-openjpeg` which only compiles openjpeg (not combined with something like dcm2niix) and its [size is 367 kB](https://www.npmjs.com/package/@cornerstonejs/codec-openjpeg?activeTab=code)

I have also tested the jpeg build of dcm2niix WASM in the browser using the `Aliza-DICOM-viewer-HTJ2k/HTJ2K-YBR_ICT.dcm` test image that was tested in issue #897. The resulting NIFTI file renders in niivue the same as Slicer3D:

<img width="1507" alt="Screenshot 2025-01-19 at 21 51 06" src="https://github.com/user-attachments/assets/78995a37-7fa3-4a72-82f9-5211bec6d39c" />

## To test this PR locally

You will need:
- NodeJS/NPM
- Emscripten (only needed separately from pixi if on macOS-arm64)
- Pixi
- Make/Cmake

[Pixi](https://prefix.dev/) is used to create the environment for building the WASM port of `dcm2niix`. To install pixi, follow their instructions. 

> Note: on macos-arm64, you can get emscripten using homebrew since there is not yet a native arm64 version of emscripten on conda-forge (which is where pixi searches for packages).

### Building dcm2niix WASM

```bash
# from repo root
pixi run wasm
```

### clean up after build

```bash
# from repo root
pixi run clean
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95d4321baa24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.