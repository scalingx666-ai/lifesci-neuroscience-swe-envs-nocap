# Issue

**Title:** Tracing overlay: Connector nodes now crosshairs

## Description

Connector nodes usually label small, biologically interesting features
like synapses. Previously, the solid disc would obscure most of the
morphological detail. This discouraged users from actually labelling
the feature (they instead annotated an area near it). Now, connector
nodes are rendered as a slightly larger ring with a small crosshair
in the middle.

Specifically, automated feature detection algorithms which produce point annotations will much prefer to place them in the object rather than put them somewhere nearby, and if more human annotation had been done on the object itself, associating automatic and ground truth annotation is much easier. 

This is an MVP for #1512, without any of the fancy project-customisable shenanigans @aschampion suggested.

TODO:

- [x] Draw outgoing connector edges from the connector node's exterior rather than its centroid
- [ ] Look into the SVG stuff `wontfix`
- [ ] Account for the line weight when deciding where to stop incoming connector edges `minor: wontfix`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e1233c938e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.