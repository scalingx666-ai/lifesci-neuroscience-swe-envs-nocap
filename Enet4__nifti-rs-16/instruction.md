# Issue

**Title:** InMemNiftiVolume::from_raw_data

## Description

Usage would look like:

    let mut header = obj.header().clone();
    let mut volume = obj.into_volume();
    // modify something in header, like dim, or modify raw_data, but it's a bad idea!
    volume = InMemNiftiVolume::from_raw_data(&header, volume.to_raw_data()).unwrap();

I did what I did because I only have a single use-case to consider. I'm not too sure about:

1. receiving a header. It seemed better than asking for `dim`, `datatype`, `scl_slope`, `scl_inter` and `endianness`, but it forces the programmer to create a header. I don't think it's a problem because it's easy to create one with `default` and the `..` syntax.
2. returning a Result. I don't like it, but I don't like asking for a `datatype` either.

I added **a test** for my "false 4D image" that I didn't push because I don't know if you want to have more toy images in your lib.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8504896c462`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.