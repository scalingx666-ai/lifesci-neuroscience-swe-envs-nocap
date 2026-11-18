# Issue

**Title:** Resection identification in Brainstorm

## Description

This PR integrates the resection-identification from https://github.com/ajoshiusc/auto_resection_mask/tree/brainstorm-plugin as a Brainstorm plugin. Given a pre and post op MRI, this generates two resection masks:
1. Postop MRI resection mask
2. Postop MRI resection mask warped in the preop MRI space. ~(Discussed this with @ajoshiusc and this is the most relevant one that is used in the community, so I am just importing that).~
EDIT: As discussed on Slack, we import both the masks (as atlases) and the post2preop coregistered MRI from the plugin outputs.
EDIT2: It is also relevant that we generate the `resection volume` from the masks.

Test data: [Example data](https://drive.google.com/drive/folders/1vuI-YwELv8ZMxgxF7ioWN9ceHjArwV91) from the repo above.

1. The process can be found as seen in the image below. The process requires choosing the preop and postop MRI NIfTI files using the file browser.
<img width="500" height="400" alt="image" src="https://github.com/user-attachments/assets/95394a40-de09-47a0-8456-f8af48ec536c" />


2. If pre and postop MRI already present in a subject, one can ~select both of them,~ right-click on the postop and start the resection identification as seen below.
<img width="350" height="250" alt="image" src="https://github.com/user-attachments/assets/3bb21456-4f28-46e8-bece-86e4e531acdc" />



Tutorial (WIP): https://neuroimage.usc.edu/brainstorm/Tutorials/ResectionIdentification

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d86e24e1dba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.