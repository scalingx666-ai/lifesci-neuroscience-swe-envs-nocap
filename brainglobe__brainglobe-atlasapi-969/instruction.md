# Issue

**Title:** add new version of molerat atlas packaging script

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Alireza from the Malkemper lab has provided the next version of the molerat atlas. It differs from the previous by
- has 4 additional vascular templates
- has modified PAG annotation

I have updated the[ raw materials GIN repo with these new materials.](https://gin.g-node.org/BrainGlobe/molerat_materials/src/master/)

**What does this PR do?**

- Fetches data from the new materials ZIP file
- Points to the new annotation file within there
- Passes additional references to the wrapup function


## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

Output of local packaging script looks reasonable:
```
(brainglobe-atlasapi) alessandro@support-XPS-8950:~/dev/brainglobe/brainglobe-atlasapi(molerat-fusi)$ python atlas_scripts/african_molerat.py 
Reading structures files
Number of brain regions: 34, max tree depth: 3
root (999)
├── CB (128)
├── CTX (77)
│   ├── BLA (177)
│   ├── BMA (50)
│   ├── ENT (231)
│   ├── HIP (168)
│   ├── LA (104)
│   ├── OLF (5)
│   │   └── COA (76)
│   ├── PA (36)
│   └── PAA (185)
├── HY (221)
│   └── SCH (195)
├── MB (43)
│   ├── IC (17)
│   ├── OP (122)
│   ├── PAG (145)
│   └── SC (60)
│       └── SCs (250)
├── MY (28)
│   └── CN (99)
├── P (200)
│   └── PG (140)
├── PAL (139)
│   └── BST (68)
├── STR (39)
│   ├── AAA (90)
│   ├── CEA (159)
│   ├── MEA (213)
│   └── STRd (110)
└── TH (59)
    ├── LG (86)
    └── MG (131)

2026-09-28 16:34:50.534 | INFO     | brainglobe_atlasapi.atlas_generation.mesh_utils:construct_meshes_from_annotation:415 - Using 18 threads for mesh creation
Creating meshes ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 0:00:40
In the end, 34 structures with mesh are kept
Finished mesh extraction in :  0.7  minutes
In the end, 34 structures with mesh are kept
Warning: `cleanup_files` argument is deprecated and has no effect
Warning: `compress` argument is deprecated and has no effect
Uploading: 100%|█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 44/44 [00:00<00:00, 88.33it/s]
Processing annotations: 100%|████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 34/34 [00:10<00:00,  3.20it/s]
Running atlas validation on /atlases/african_molerat_20um/3_1
This atlas is valid
```

Suggesting atlas is valid. Sanity-check visualisation following packaging:
```python
from brainrender_napari.napari_atlas_representation import NapariAtlasRepresentation
from brainglobe_atlasapi import BrainGlobeAtlas
import napari

if __name__ == "__main__":
    viewer = napari.Viewer()
    viewer.dims.ndisplay = 3
    atlas = BrainGlobeAtlas("african_molerat_20um", brainglobe_dir="/home/alessandro/brainglobe_workingdir/", version="3.1", check_latest=False)
    napari_atlas = NapariAtlasRepresentation(atlas, viewer)
    napari_atlas.add_to_viewer()

    print(atlas.additional_references)
    napari_atlas.add_additional_reference("african_molerat-vascular_AP-smoothed-template")
    
    napari_atlas.add_structure_to_viewer("root")
    napari_atlas.add_structure_to_viewer("PAG")
    napari.run()
```
and switching to grid mode visualisiation:

<img width="2697" height="1170" alt="image" src="https://github.com/user-attachments/assets/8c25d527-ac14-4a8d-a45e-1c461020e5f3" />

suggests new templates and re-annotated region are packaged correctly (and everything else looks correct too).

## Is this a breaking change?

Nope

## Does this PR require an update to the documentation?

Yep, additional references should be documented (separate PR to BG website in progress).

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b727c5cfb6f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.