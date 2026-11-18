# Issue

**Title:** Set annotation LUT directly

## Description

I was having an issue where one label in an annotation would mistakenly be colored bright blue. e.g. this is an incorrect rending of the Yeo2011_7Networks_N1000 annot included with Freesurfer:

![image](https://user-images.githubusercontent.com/315810/62086475-6982dd80-b22c-11e9-97c7-3a4bb25ce97e.png)

The issue seems to be this. [`add_annotation`](https://github.com/nipy/PySurfer/blob/master/surfer/viz.py#L3296) is setting the colors by calling `surf.module_manager.scalar_lut_manager.load_lut_from_list`. This keeps the lookup table at 255 colors and sets the first `n` colors where `n` is the length of the list you pass in. So what's happening is the "wrong" label is the largest ID in the annotation, and it is being colored in with the next color, which is blue (for a relatively small annotation). Why is that happening? It's not exactly clear. I don't see anything obviously wrong with the code we are using to set the scalar values of the annotation mesh. It may be a bug in mayavi.

In either case, it's also possible to set the LUT trait directly. This seems to fix my issue:

![image](https://user-images.githubusercontent.com/315810/62086604-e1510800-b22c-11e9-83c7-9f496b48abd5.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27f54c652aa1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.