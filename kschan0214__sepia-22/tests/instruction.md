# Issue

**Title:** New echocombine

## Description

Hi Kwok,

This pull-request includes romeo phase unwrapping and the romeo total field calculation option.
I requires ROMEO version v3,2.4 (or future releases, which should be compatible)
https://github.com/korbinian90/ROMEO/releases

I included the option to use the romeo mask inside sepia. This just replaces the mask in headerAndExtraData. It works but may not be the best way to do it. Also the mask cannot be saved this way.

Implementation detail:
Romeo requires temporary storage as the files are first written to disk, then romeo is called and produces output files on disk. The temporary storage is in the default OS tempdir, created by `fullfile(tempdir, 'romeo_tmp')`.
As I didn't find a way to access the output directory for SEPIA, I couldn't write romeo outputs there. The temporary folder is created and deleted at the end.

Thanks again for adapting SEPIA to allow custom echo combinations!
And please let me know, if there are some aspects that I could improve.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `882c727d3b01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.