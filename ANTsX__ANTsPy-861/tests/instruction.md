# Issue

**Title:** BUG: mask_image should apply the mask to the input

## Description

The docstring said:

>    level : scalar or tuple of scalars
        Level(s) at which to mask image. If vector or list of values, output image is non-zero at all locations where label image matches any of the levels specified.
        
But this is only true if binarize is True. 

The binarize option

>    binarize : boolean
       whether binarize the output image

didn't actually binarize the output, it binarized the mask without reference to the scalar image. So
```
>>> masked = ants.mask_image(img, mask) # NOT non-zero where mask matches level
>>> masked_binary = ants.mask_image(img, mask, binarize=True) # NOT a binarized version of masked
```

Now fixed to always mask the scalar image, and binarize afterwards if requested. This can be used to subset labels with
```
ants.mask_image(labels,labels, level=(1,2,3,4))
```

or create a binary mask
```
ants.mask_image(labels,labels, level=(1,2,3,4), binarize=True)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8b0addc3c62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.