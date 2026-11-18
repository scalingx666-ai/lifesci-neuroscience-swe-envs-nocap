# Issue

**Title:** feat: add bmesh parameter to allow users to supply a mesh

## Description

This is largely in response to PR #2 . Kind of like in the plot_vertexwise function, this simply allows the user to bypass internal bmesh loading.

This doesn't specifically address PR #2 , but I think that's a separate issue. 

As an aside, what I've done here could potentially make plot_vertexwise redundant:

```
lh, rh = make_vertexwise_mesh(...)
yab.plot_vertexwise(lh, rh)
```

currently works as

```
mesh = {'L': lh, 'R': rh}
yab.plot_cortical(bmesh=mesh)
```


Personally, I think it makes sense to separate the concerns and keep mesh creation away from mesh plotting. Let me know what you think.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f25028a8e395`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.