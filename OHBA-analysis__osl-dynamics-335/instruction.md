# Issue

**Title:** Improved power map plotting

## Description

Normally the colour bar labels are too small when we plot power maps. We try and improve this here.

Changes:
- New function to make brain surface plots: `osl_dynamics.utils.plotting.plot_brain_surface`.
  - This function is a wrapper for [nilearn.plotting.plot_img_on_surf](https://nilearn.github.io/stable/modules/generated/nilearn.plotting.plot_img_on_surf.html).
- `osl_dynamics.analysis.power.save` now wraps the new function.

##

The function now produces plots like this by default:
![maps_0](https://github.com/user-attachments/assets/243c3e58-dca7-45c7-8110-6dd3b34360b0)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cff19fa07661`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.