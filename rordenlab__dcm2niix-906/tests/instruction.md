# Issue

**Title:** Re-add zlib support and enable jpegls support

## Description

@neurolabusc , the development branch seems to have lost my changes that enabled WASM zlib support. The NPM package that is published has this support, but the make file in the repo was clobbered somehow. 

I have:
- enabled WASM zlib support in the wasm target again
- enabled jpegls support in the new wasm-jpegls target
- updated the npm package build to export both the jpegls and non-jpegls builds

Developers using `@niivue/dcm2niix` can choose which build they want to import into their apps by using one of the following:

### Default, without jpegls
```
import { Dcm2niix } from '@niivue/dcm2niix' // default, and without jpegls
// Chris Rorden's dcm2niiX version v1.0.20241231  Clang20.0.0
```

### With jpegls
```
import { Dcm2niix } from '@niivue/dcm2niix/with-jpegls'
// Chris Rorden's dcm2niiX version v1.0.20241231  (JP-LS:CharLS) Clang20.0.0
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3eb4281f805f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.