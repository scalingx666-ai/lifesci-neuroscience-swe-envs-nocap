# Issue

**Title:** Move endianness info to NiftiHeader

## Description

This PR changes `NiftiHeader` so that it contains an extra `endianness` member containing the byte order of the originally read file. When building a new header, the system's native endianness will be the default. Moreover, the respective constructors will no longer yield a `(header, endianness)` pair:

```rust
// before
pub fn from_file<P: AsRef<Path>>(path: P) -> Result<(NiftiHeader, Endianness)> { ... }
// after
pub fn from_file<P: AsRef<Path>>(path: P) -> Result<NiftiHeader> { ... }
```

This is a design decision that has kept in my mind for a while, but now I honestly believe it's worth the breaking change, for the following reasons:

- It is unconventional to see constructors such as `from_stream` and `from_file` to return a tuple rather than just `Self` or `Result<Self>`.
- Returning a tuple makes these functions more complicated to work with.
- The header's byte order is an inherent property materialized in how the contents were written to disk, and that property is lost in the current reading process (which harmonizes all attributes to native byte order).
- `NiftiHeader` does not have a native memory representation anyway. The `descrip` member was already put into a `Vec<u8>` (arrays larger than 32 are currently bad to work with), so one shouldn't be relying on this type to be a memory equivalent of the respective C-like struct. Adding an extra member is not a problem in this regard.
- And finally, those focused on using the `NiftiObject` API shouldn't notice a difference.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b12fa91eb25a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.