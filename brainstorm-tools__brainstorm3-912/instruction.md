# Issue

**Title:** [2/3] Fastgraph: Remove SPES artifacts using EMD

## Description

This PR is the 2nd part required for [Fastgraph](https://pubmed.ncbi.nlm.nih.gov/32086098/). It involves cleaning the data for any artifacts. 

**Prerequisite:** Follow steps in PR  

# Remove SPES artifacts
Linked to `process_remove_spes_artifacts`  and it involves removing SPES artifacts and slow drifts using the Empirical Mode Decomposition (EMD) based filtering.

## The GUI
<img width="450" height="320" alt="image" src="https://github.com/user-attachments/assets/fd0b0e99-713c-46c8-94e3-9013ee674753" />

## Inputs
- **<ins>Stimulation event</ins>**: The stimulation event around which to remove the artifacts (here, `STIM`)
- **<ins>EMD cutoff frequency</ins>** (in Hz): Self explanatory
- **<ins>Time to account for artifact</ins>** (in ms): The duration of the actual stimulation artifact itself, starting at the stimulation event. Used to set the main artifact span inside the interpolation window (here, `5` ms).
- **<ins>Time on either side of the artifact to spline with</ins>** (in ms): How much clean signal to take from before and after that artifact window so the spline has anchor points to interpolate across the bad segment (here, `3` ms).

## Steps to use
1. Follow steps as in PR #911 .
2. Drag the loaded stimulation blocks into the `Process1` tab. For e.g. `SB A13-A14 4 (#1)` .
3. Click on `Run > Stimulation > Remove SPES artifacts`. 
4. Fill in the values as seen in the GUI figure above. Click `Run`.

It creates new stimulation block e.g. `SB A13-A14 4 (#1)_emd`. The results can be seen as under.
<img width="1628" height="605" alt="Screenshot 2026-04-21 140035" src="https://github.com/user-attachments/assets/53b202bc-49dc-4ea0-85fb-89afdffc48d3" />


## Associated PRs
1. 
2. #916 

@jcmosher @Nastaranlotfi @yashvakilna

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d559cee4d9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.