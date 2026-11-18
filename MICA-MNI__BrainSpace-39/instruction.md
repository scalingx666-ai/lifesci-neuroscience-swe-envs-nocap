# Issue

**Title:** Grid layout for `plot_hemispheres`

## Description

References #37, in which `plot_hemispheres` can additionally plot brains as a 2x2 grid. This PR includes an additional argument, `layout_style` which can be set as 'row' (i.e. the current layout), or 'grid' (i.e. the 2x2 layout). A minimal example with a colorbar:

```python
from brainspace import plotting, datasets

lh, rh = datasets.load_conte69()
labeling = datasets.load_parcellation('schaefer', scale=400, join=True)

plotting.plot_hemispheres(lh, rh, array_name=labeling, 
                          zoom=1.7, size=(500, 300), 
                          color_bar='right', layout_style='grid')
```
Output:
![grid](https://user-images.githubusercontent.com/14634382/112659766-157a3300-8e2b-11eb-9f42-0c5be9356ce5.png)

Conveniently, handling labels didn't require any changes. Labels can still be passed as lists, such that colums and rows are each labelled:

```python
plotting.plot_hemispheres(lh, rh, array_name=labeling, 
                          zoom=1.3, size=(600, 500), 
                          color_bar='right', layout_style='grid', 
                          label_text={'left': ['Lateral', 'Medial'], 'top': ['Left', 'Right']}, 
                          screenshot=True, filename='grid_labels.png')
```
Output:
![grid_labels](https://user-images.githubusercontent.com/14634382/112659772-17dc8d00-8e2b-11eb-9bd7-6f86931b47bc.png)

Wasn't sure where to call `layout_style` or layout

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fb001f4961d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.