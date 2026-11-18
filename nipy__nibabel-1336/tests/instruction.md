# Issue

**Title:** ENH: Add `.content`, `.text` and `.json` properties to NIfTI extensions

## Description

The NIfTI-MRS standard (https://github.com/wtclarke/mrs_nifti_standard/) includes a JSON extension. My initial attempt at this (in #1327) created a `NiftiJSONExtension` class, but this had the side-effect of breaking code that already loaded the extension as bytes and manually decoding.

This PR instead includes the following protocol:

```python
class NiftiExtension:
    content: bytes
    text: str
    json: dict[str, Any]
```

This follows the protocol used by requests and httpx and assumes that most extensions will be sufficiently served by one or another of these three attributes (properties, actually), and mangling/unmangling is only needed for more intricate types, such as DICOM.

Nifti1Extension is a non-ideal base class for NIfTI extensions because it assumes that it is safe to use an identity transformation to convert between the on disk and in memory representation of the extension contents, and thus default to `bytes` objects. This makes it difficult to define its typing behavior in a way that allows subclasses to refine the type such that type-checkers understand it.

This patch creates a generic `NiftiExtension` class that parameterizes the "runtime representation" type. Nifti1Extension subclasses with another parameter that defaults to `bytes`, allowing it to be subclassed in turn (preserving the Nifti1Extension -> Nifti1DicomExtension subclass relationship) while still emitting `bytes`. Further, this allows extensions to be created with either bytes or an object (for subclasses that define a particular object type), avoiding unnecessary mangle/unmangle round-trips.

We could have simply made `Nifti1Extension` the base class, but the mangle/unmangle methods need some casts or ignore comments to type-check cleanly. This separation allows us to have a clean base class with the legacy hacks cordoned off into an subclass.

The `Cifti2Extension` needed very little updating.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83eaf0b55be9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.