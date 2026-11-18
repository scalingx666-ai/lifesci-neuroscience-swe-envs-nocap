# Issue

**Title:** Juliac compat: Generate header read, write and byteswap field by field

## Description

**This is still experimental**

Reading a header was already generated from the packed layout; writing and byte swapping iterated over field names at run time. Both are now generated the same way, string fields are built with a Val length instead of a splat, and the orientation keyword is no longer reassigned, which boxed it in the closures. None of this changes a written byte: the new test compares the output with the fields concatenated.

Two things fell out of it. A byte swapped NIfTI-2 header was not recognised, since the check compared with 348 for both header types; it now compares with the size of the header being read. And the buffer behind the unsafe loads and stores is kept alive with 

The point is static compilation: with this, a program that builds a NIVolume, writes it and reads its header back compiles with juliac --trim (Julia 1.13), where it failed the verifier before. niread stays dynamic by design, since its element type comes from the file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `baf1d578ac90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.