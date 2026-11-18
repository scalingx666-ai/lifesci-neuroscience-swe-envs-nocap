# Issue

**Title:** Refactor & update fooof.synth.transform

## Description

Responds to / related to #109

This is a primarily a refactor and extension of fooof.synth.transform. A couple other small updates for naming consistency (using the same convention for gauss*_params between SynParams & gen, and standardizing on calling the ap param 'offset', instead of 'intercept'). 

Notes / comments (mostly Qs for @rdgao):
- Do we know how the knee behaves with these kind of transforms? From quick tests, it appears that, rotating the spectrum does not preserve the knee (which, I think, is to be expected). I'm guessing we can work through figuring out how it does so - though perhaps for now we can just add a note that this is only designed for rotating 'fixed' spectra? (I don't currently need the knee case). 
- I switched the convention for the direction of rotation, so now positive value steepens, etc (this, I think, is consistent with FOOOFs conventions of using positive exponents). This seems like the more obvious way to do it (given how FOOOF sets up the equations), since a delta of + 0.2 can be interpreted as "OG-val + 0.2", and -0.2 as "OG-val - 0.2", etc. I originally hit this point based on an unexpected sign flip in when updating parameter values.  In the code, this meant adding a negative sign in rotate_spectrum (and calc_rot_offset). Do you have any reason to disprefer doing this? I can switch it all back if theres a reason this update doesn't make sense somehow. 
- rotate_spectrum is now quite different from the original function in NDSP. In terms of scoping, I would probably suggest removing that function from NDSP? But if we really want to keep it, we could update it there, similarly to here. 

ToDo: we should add some notes on the derivations that perform these transformations. I'm gonna leave that to @rdgao if possible :). 

@ArcadeShrimp : as a user of this kind of functionality, do you want to eyeball this and check that it makes sense to you? You don't have to worry about the implementation details / math - but just check if this seems useful from a user-facing perspective. 

Note that an open idea in #109 is also to have an option to simulate spectra with specified rotation points directly in the gen_* functions. This is doable (I think, in a clean way) - but not added, and could be. 
^Edit: this idea seems to get a little complicated in terms of dealing with also with generating knee spectra - so will pause on that idea until we figure that part out.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db08f6fa4adf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.