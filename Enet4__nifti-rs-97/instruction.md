# Issue

**Title:** Make the set_x_affine functions public

## Description

We realized while working on a terrible ANTs affine bug that those functions should be public, so that the programmer has more options than this method:

    pub fn set_affine<T>(&mut self, affine: &Matrix4<T>)
    where
        T: RealField,
        T: SubsetOf<f64>,
        T: ToPrimitive,
    {
        // Set affine into sform with default code.
        self.set_sform(affine, XForm::AlignedAnat);

        // Make qform 'unknown'.
        self.set_qform(affine, XForm::Unknown);
    }

This is our (Imeka) way of doing things, but it may not be everyone else's way.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37f21f0ca9f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.