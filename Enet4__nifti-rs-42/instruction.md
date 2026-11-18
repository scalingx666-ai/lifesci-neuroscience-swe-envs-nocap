# Issue

**Title:** Affine management

## Description

Fix #22. Adds 2 public methods to `NiftiHeader` and a lot of other methods/functions in `header.rs` and `affine.rs`. This is mostly a port from NiBabel because:

- I don't actually know how quaternion works
- NiBabel has been tested extensively, by us and the whole community.

We (at Imeka) have been testing this port for more than 6 months now and we're quite happy with it. The code was in our open sourced project called [trk-io](https://github.com/imeka/trk-io/blob/master/src/affine_nifti.rs). I simply cleaned it, moved some functions to methods, etc.

I do have some questions though:

- I'm still unsure what should be public. `get_affine` and `set_affine` is the bare minimum and this is what I choosed. It might be a good idea to set the 'sform' and 'qform' methods public too.
- You know from my previous contributions that I don't use `Error` much. I prefer the `panic` alternative, but I know you will tell me to use `Error` :)
- I did everything in f32 but it should either be templated (to avoid forcing the users to convert their matrices) or in f64 (the math, at least). I'll probably do that in my next version.
- I hate formatting when I use matrices! Continued below.

I know I can use `#[rustfmt::skip]` on construction, but I don't like to see those things in my code. And you can't use it when you return a variable :| I tried using `from_rows` to avoid long lines but some lines in some matrices are still too long. I simply called rustfmt on `header.rs` and `affine.rs`, then I reverted the changes on the matrices because it's unreadable. You might disagree on this subject, I'm interested to know your opition.

    Affine4::from_rows(
        Vector4::new(m[0] as f32, m[3] as f32, m[6] as f32, self.quatern_x),
        Vector4::new(m[1] as f32, m[4] as f32, m[7] as f32, self.quatern_y),
        Vector4::new(m[2] as f32, m[5] as f32, m[8] as f32, self.quatern_z),
        Vector4::new(0.0, 0.0, 0.0, 1.0),
    )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6de3883f1894`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.