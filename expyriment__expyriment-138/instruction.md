# Issue

**Title:** Fix shape bug

## Description

I rewrote the core functions of shape. It now really does what it should do (check e.g. shape.points_xy) and is a bit optimized. 

However, there the plotting on the correct polygon has obviously  bug in pygame and the resulting width (not height!) of the surface has to be one pixel enlarger than you would expect. see the resutling sizes:
```
print(shape.shape_size)
print(shape.surface_size)
```

It become nice obvious if you plot the new test stimulus (regular comb-like object)
```
expyriment.stimuli.Shape._test(..optional..)
```

and switch of the fixing of the polygon bug in shape.py line 30

What do you think?


------
PS:  This is still a bug (not a fixcross bug), which I do not understand.
```
stimuli.FixCross(size=(21,21), line_width=1).plot()
```

But
```
stimuli.FixCross(size=(21,21), line_width=2).plot()
```

Th

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e2fca900a7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.