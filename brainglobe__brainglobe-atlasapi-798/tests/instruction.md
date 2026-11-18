# Issue

**Title:** Allen Common Coordinate Framework Version 2 Mouse Atlas

## Description

## Description

PR for Allen CCFv2 Mouse Brain Atlas, Fiber Tracts Atlas and Developmental Atlas. 

**What is this PR**

- [ ] Bug fix
- [X] Addition of a new feature
- [ ] Other

**What does this PR do?**
Adds theAllen CCFv2 atlas packaging script to BrainGlobe

## References
Issue #730 
Publication: https://doi.org/10.1038/nature05453
https://download.alleninstitute.org/informatics-archive/october-2014/annotation/

Template: https://download.alleninstitute.org/informatics-archive/october-2014/annotation/atlasVolume.zip
Annotation: https://download.alleninstitute.org/informatics-archive/october-2014/annotation/P56_Mouse_annotation.zip
Structures: https://download.alleninstitute.org/informatics-archive/october-2014/annotation/structures.csv
Fibre annotations: https://download.alleninstitute.org/informatics-archive/october-2014/annotation/P56_Mouse_annotationFiber.zip
Dev annotations: https://download.alleninstitute.org/informatics-archive/october-2014/annotation/P56_DevMouse2012_annotation.zip

## How has this PR been tested?

Tested locally on a Windows machine. 

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Needs a blog post and update to list of atlases. 

## Checklist:

- [X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Link to tar.gz files: 

[Files](https://drive.google.com/drive/folders/1yz7hxRyZbxb_pi__Uh7gisc-IAWwd0kU?usp=sharing)

## Images of the atlas in Napari: 

### CCFv2 Mouse Brain: 

<img width="2560" height="1368" alt="Screenshot 2026-04-25 082411" src="https://github.com/user-attachments/assets/2c446356-52e9-4855-8fa2-6e51bbd31e69" />

<img width="2560" height="1368" alt="Screenshot 2026-04-25 082506" src="https://github.com/user-attachments/assets/d150e511-5e23-42fd-b8bd-8454248ca376" />


### CCFv2 Mouse Fiber Tracts:

<img width="2560" height="1368" alt="Screenshot 2026-04-25 082831" src="https://github.com/user-attachments/assets/1fcab95b-6234-4f5c-bc1e-1cbc31b0f9a7" />

<img width="2560" height="1368" alt="Screenshot 2026-04-25 082904" src="https://github.com/user-attachments/assets/5ba9db52-fedf-4684-b001-048c65276cd3" />


### CCFv2 Developing Mouse Brain: 

<img width="2560" height="1368" alt="Screenshot 2026-04-25 084748" src="https://github.com/user-attachments/assets/fba656d1-ae61-4363-a4d1-82f86c47cd05" />

<img width="2560" height="1368" alt="Screenshot 2026-04-25 084835" src="https://github.com/user-attachments/assets/f41c8bf3-71e1-4f48-9e09-93f6533ee7e1" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fd58012a268`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.