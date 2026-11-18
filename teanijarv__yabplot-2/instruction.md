# Issue

**Title:** feat: Add support for generating background mesh from a brain mask when viewing native space bundles

## Description

Hi @teanijarv !

Thank you for developing this nice library! I have a rather specific (or maybe not) use case where I would like to use your library to generate QC screenshots of WM bundles. The thing is, the bundles are in subject-space, so overlaying them with template meshes gives poor results.

I propose adding an option to visualize the bundles with a mesh generated from a brain mask. This way, bundles can be viewed even in subject-space while having a background for a rough estimate of the location within the brain.

Here's a code snippet to test it out:
```python
mesh = yab.load_nii_as_mesh(
    nii_path="nii/path.nii.gz",
    blur_sigma=1.5,
)

p = yab.plot_tracts(
    custom_atlas_path="tracks/",
    views=['anterior'],
    bmesh=mesh,
    display_type='object'
)

# open a gif file
gif_path = os.path.join("./", "brain_rotation.gif")
p.open_gif(gif_path)

# rotate the camera 360 degrees by 5 frames
for angle in range(0, 360, 5):
    p.camera.azimuth += 5
    p.write_frame()
p.close()

from IPython.display import display, Image
display(Image(filename=gif_path))
```
And here's an example of what it would look like:
![brain_rotation](https://github.com/user-attachments/assets/f9c32990-1469-4bf6-abe3-bd17e1ca0d96)

I tried to modify as few lines as possible, feel free to ask for changes if needed. Again, great library!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae58ae108427`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.