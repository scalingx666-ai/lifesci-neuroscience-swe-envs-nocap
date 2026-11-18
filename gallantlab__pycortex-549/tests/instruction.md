# Issue

**Title:** NF display values at vertex in webgl viewer

## Description

This PR adds the feature of visualizing the VertexData value when hovering on the surface or when clicking on a specific vertex.

Example code to test that it works as intended (unfortunately it's hard to automate):

```python
import cortex
roi = cortex.get_roi_verts("S1", roi=["EBA"], mask=True)["EBA"]
roi = roi.astype(float)
vtx = cortex.Vertex(roi, "S1")
cortex.webgl.show(vtx)
```

Example images
<img width="800" alt="image" src="https://github.com/user-attachments/assets/e52e84e1-18a3-4419-ac6c-182532b60a28">
<img width="800" alt="image" src="https://github.com/user-attachments/assets/c2f213fb-3c1d-4ae5-8a7b-8233dd43ba1d">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6237fe3b3422`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.