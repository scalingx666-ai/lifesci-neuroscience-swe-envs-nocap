# Issue

**Title:** Fix bitpix for UInt8 writes

## Description

## Summary


UInt8 and other short headers now use the correct bitpix in the header.

The new test covers all data types and fails on the old version.


## Details
bitpix is the number of bits per voxel as stored, so it has to agree with datatype. niupdate took datatype from eltype(R) and bitpix from T, the NIVolume's first type parameter - which is the scaled type typeof(one(T)*1.0f0+1.0f0) that indexing returns after scl_slope/scl_inter, not the type on disk.

So every integer width other than 32 bits got a header contradicting itself: UInt8 wrote datatype 2 with bitpix 32, Int16 datatype 4 with bitpix 32, Int64 datatype 1024 with bitpix 32. Bool escapes through its own constructor, which keeps T = Bool, and the 32-bit types escape because the wrong answer happens to match. The keyword constructor already gets this right by passing one t to both; niupdate then overwrote it on every write.

Round-tripping through NIfTI.jl is unaffected, since niread reads datatype and ignores bitpix - the damage is to readers that trust bitpix, which is why it went unnoticed. It surfaced writing UInt8 brain masks for tools outside Julia.

Test covers all thirteen supported element types.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4924df4deb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.