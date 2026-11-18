# Issue

**Title:** WIP: added hxsurf addition

## Description

I needed an easy way to concatenate 2 hxsurfs, I did not find any better way to do it, so I implemented this simple method. For example:

```r
h1 = as.hxsurf(icosahedron3d(), 'a')
h2 = as.hxsurf(tetrahedron3d(), 'b')
h3=h1+h2
plot3d(h3)
```
![Screenshot 2021-09-01 at 15 20 38](https://user-images.githubusercontent.com/4547289/131688398-65ba0a94-317a-40b8-ab86-d2d570cb84f8.png)

The problem is that right now hxsurf inherits operations from dotprops, which makes sense for most but not all of them.

```r
Ops.hxsurf <- Ops.dotprops
```

I'm not sure how to point the package to what is the desired method to call in that case.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8d420ca075b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.