# Issue

**Title:** Last tweaks

## Description

FOOOF Last PR:
	Okay, so like actually though, these should be pretty much the last changes. 

Change Log:
- Clean up FOOOFGroup API, by updating so that .load() loads a group file (by aliasing FOOOF.load()), and similarly for .fit() and .save().
- Fix up Group plotting for including knee, including a re-org, increased modularization of plotting methods. This includes moving out some plot templates to a separate file.
- Move synthetic PSD generation outside of test code, so it's more accessible for general use.
- Add some test code, more explicit/modular testing of some functions/methods.
- Make FOOOFResult consistent with FOOOF object - oscillations_params -> oscillation_params
- After hemming and hawing: added _gaussian_params to FOOOFResult object. It makes some back and forth easier (my arg against was that it's now more confusing having two slightly different sets of params for oscillations, but they are each somewhat differently useful). I'm not totally convinced by this - but updated, at least for now.
- Add support for putting results back into FOOOF object (to, for example, regenerate and plot the model), rebuilding a FOOOF object from FOOOFGroup. 
- Save out FOOOFGroup results post-fitting (this is made easier & more consistent with updating FOOOFResult, and putting results back into FOOOF). 
- Remove option to 'save as you go' while running FOOOFGroup. This option wasn't clearly super useful, and somewhat complicated / messied things. Could be re-added.
- Added support for running FOOOFGroup in parallel. 

- Full py2 compatibility looks to be pretty annoying to retrofit and maintain at this point, because I didn't write a bunch of stuff with it in mind. New plan (if agreeable) is to properly release as py3 only. The core algorithm code is (I think), all Py27 compatible, so I'm going to try and make a bare-bones branch that will run on py27, but without some of the 'frills', for any who really want/need that (but strongly recommend that people use py3).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1f5b8897550`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.