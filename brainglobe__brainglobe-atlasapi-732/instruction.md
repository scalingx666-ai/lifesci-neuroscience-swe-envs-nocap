# Issue

**Title:** add CArea atlas generation script

## Description

This adds the unpublished Clustered Area (CArea) atlas. There will soon be a preprint and I will update the script with that DOI once this is out. 

I have validated this works in napari and that the template is within the mesh extent. 
<img width="1917" height="1028" alt="image" src="https://github.com/user-attachments/assets/ac9c7145-3bdf-441c-bf54-80629df31a92" />

One thing is it fails a validation function saying that a pixel is more than 10 times the mesh extent. I'm not sure what this is about but it could be a quirk of this atlas, given that the regions are noncontiguous. Everything looks good in napari.
<img width="1175" height="174" alt="image" src="https://github.com/user-attachments/assets/f66fe2ae-61f0-4511-9b16-bb07abbabf71" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5508e5525af6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.