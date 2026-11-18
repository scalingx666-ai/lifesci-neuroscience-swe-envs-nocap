# Issue

**Title:** Support all POD for ndarray

## Description

Hi Enet4. my company needed to load more datatypes and I didn't want to disturb you so I added them myself. The way I did it, it first loads the header-defined datatype so there's no precision loss, then it casts to the desired type, which may be bad for the precision. However, this is not our fault because it's the user-desired type... he's supposed to know what he's loading. You can use it the same way you did before: `volume.to_ndarray::<u32>()` or any other type.

I understand that this is not idiomatic Rust. I'm a python and C++ programmer by trade so my rust is not as good as it could be. Please be as critical as you would be to your own code.

You were going, I believe, in another direction with the type management. I'm not too sure where you where going though so I coded it like I would in C++. If you actually prefer another way, just tell me and close this PR. My company will use my fork though because it's working quite well and we need it now :)

This should be tested a lot, so I tested everything... **except the weird types (complex, rgb and 128)** I only used `u8`, `i16` and `f32` in real-life tests though. 128bits would be quite easy to add.

If you actually merge this, I'll probably send a PR specific dimension (instead if dynamic) and a PR for the rgb types because we might need them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `149a1cf8ca6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.