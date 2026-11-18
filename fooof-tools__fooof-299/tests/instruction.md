# Issue

**Title:** [MNT] - Optimizations for curve fit

## Description

This is a series of small tweaks to the fit algorithm that should result in minor improvements in run speed. 

Updates include:
- a slightly more efficient stepping across params in gaussian function
- removing unneeding 'ys' initialization in aperiodic fit functions
- setting `check_finite` to False in curve_fit (since we do our own data checking)
- expose `curve_fit` tolerance settings as a private setting, and set new default value that is a bit more liberal
- provide precomputed Jacobian matrix, for the Guassian curve_fit call*

*I did add the Jacobians for the AP functions as well, but there was more mixed results whether this provided any speedup - notably these calls are already pretty fast, and so based on [this](https://stackoverflow.com/questions/24391242/scipys-curve-fit-leastsq-become-slower-when-given-the-jacobian) post, I think for AP funcs we are often in a case in which the checks on the passed in Jacobian supercede any benefit as compared to computing it. Because of this, I did not actually set the Jacobian functions to be used in the aperiodic component curve_fit calls. 

## Results !?

Without being particularly rigorous about profiling, pretty quick / simple tests suggest this update provides something in the range of at least 5-20% speed up even in the simplest fitting cases (which is what I was expecting), but it has an unexpectedly outsized effects on more complex cases - and so in cases with knees and/or more peaks, noise etc - I'm seeing what looks like 2-3X speed increases! I didn't profile in too much detail exactly where this comes from, but I _think_ a bit part is that when we start having multiple Gaussians estimating the Jacobian is slow, but it's actually quick and easy to pass in, and also the tolerance shift can have a notable impact (the other changes are less impactful). 

In terms of outputs everything other than the tolerance levels change should have zero effect (meaning should get numerically _exactly_ the same results out). The tolerance change _can_ (though does not necessarily) change results - I've only seen it change beyond what should be notable resolution (eg. changing a peak bandwidth value by ~0.005 or so). If it's indeed limited to the this magnitude of impact, I think it's fine / worth the trade off. Note that the actual value I set (0.00001, replacing the otherwise default of 1e-8) is arbitrary - the higher this gets, more speed increase, but more chance of having more notably impacts. Also, this was added as a private setting, so one can also set it back to match previous default (`fm._tol = 1e-8`) to return to exactly the same as 1.0, or set a different value as needed. 

## Notes

- I followed some pointers from [this](https://stackoverflow.com/questions/31070618/how-to-speed-up-python-curve-fit-over-a-2d-array) stack overflow post to try and optimize things.
- The formulas for the Jacobian matrix calculations all come from [Wolfram Alpha](https://www.wolframalpha.com/). As far as I can see they provide numerically exact answers to not passing in the jacobian and it being estimated, so the outputs are exactly the same.

## Reviewing

There's not too much changed in the code to check - what would be good is if someone (@ryanhammonds perhaps) could do a quick check to replicate that a) this branch is at least a bit quicker than main, and b) you see no real change in output parameters. I'm also tagging @rdgao because you might be interested in these changes, and/or have some more knowledgeable insight over and above my heuristic updates here. 

## Addendum: what I learned about `curve_fit`

Doing some quick profiling, we spend basically all of our time in `curve_fit`, meaning it's the only real target for meaningful optimization, and within that, we spend the vast majority of our time doing the Gaussian fit (not really the guess procedure, but the curve_fit call itself). Why here? Well, it turns out with no bounds, `curve_fit` estimation method ends up as the Levenberg-Marquardt algorithm which is very fast - but does not support bounds. For peaks, we need bounds - adding those pushes the method to default to the Trust Region Reflective ('trf') which is _way_ slower. Notably, there is another option for bounded estimations ('dogbox') - which is sometimes a bit faster, but not consistently enough to try and change it (both methods give the exact same results as far as I can see).

Implications of this:
- adding bounds, in general, slows things down _a lot_. We can't avoid this for peaks. In general, we do not provide bounds for AP, and this is (somewhat counter-intuitively) much quicker than if we did, which is useful to know.
- we spend almost all our fitting time within the `curve_fit` function, with no other meaningful targets for optimization. This PR does what I could figure out to optimize how we call `curve_fit` - but my sense beyond this is that we are hitting a limit of what we can speed up without looking for different / faster implementations of the fitting procedure itself (in particular with bounds).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d63aae0bc925`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.