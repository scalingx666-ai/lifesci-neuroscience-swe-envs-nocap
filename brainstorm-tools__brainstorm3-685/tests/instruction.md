# Issue

**Title:** Update projector structure. And add ICA explained variance

## Description

This PR adds code to compute the variance explained by the IC when using ICA decomposition.

The reasonable place to store these values is the `SingVal` field in the `projector` structure. However, this changes for back compatibility are needed as this field is currently either the PCA explained variance, or a string to identify other projectors `ICA` or `REF` (montage).

https://github.com/brainstorm-tools/brainstorm3/blob/e532c6d83badc93c1476004cc493f3df08a2a369/toolbox/process/functions/process_ssp2.m#L947-L952

~~Tentative solution:~~ 
~~1. Use the Comment to identify the type of projector~~
~~2. Always require the projector Comment to have the type of projector on it~~

Implemented solution:
- [x] Add field 'Method' to 'Projector' structure to identify Projector
- [x] Support projectors without 'Method'. Get projector method from its content
- [x] Store ICA explained variance in `SingVal`


References:


---
Being `F` the original data, the independent components `Y` can be obtained by multiplying the unmixing matrix `W` with `F`. Then we can mix those ICs `Y` with the mixing matrix `M` (which is the inverse of `W`) to recover the observed data `F` this is to say `F'`

`Y = W * F`
`F' = M * Y`

Then we can compute the variance explained by each IC as: 

`varIcs = sum(M.^2, 1) .* transpose(sum(Y.^2, 2))`
`varIcs = varIcs / sum(varIcs)`

However this is the explained variance of `F'`, so these explained variances need to be scaled with ratio of variance between `F'` and `F`.

`Fdiff = (F - M * Y)`
`rVarExp = 1 - (sum(sum(Fdiff.^2, 2)) ./ sum(sum(F.^2, 2)))`

Variance in original data by each component
`varIcs = rVarExp * varIcs`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e050d9af7f15`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.