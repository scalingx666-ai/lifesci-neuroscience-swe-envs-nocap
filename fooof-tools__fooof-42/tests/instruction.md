# Issue

**Title:** Update EVERYTHING (except the actual algorithm).

## Description

Okay: so this PR is in the vein of doing a big push to get everything as usable & stable as possible to lock in for v0.1, at which point larger changes become dis-prefered. I think this gets us most of the way. There are no algorithmic change in this PR, but it does amount to pretty much a re-factor, and substantial additions, to everything else. 

Key points / updates:
- Plotting & printing reports are reorganized internally (same output), and add plot saving. 
- New 'create_report' method. This saves out a PDF report, including FOOOF results, the plot, and settings. This is an easy for people to send to us. (The internal string and plot updates are largely to support this). 
- Some small API changes on peripheral method names (printing, etc), and internal clean ups. Update to make freq_range optional, and catch for a fail point if freq=0 is included. Change name of 'fit_knee' attribute for clarity & consistency. A few organizational changes, especially to fit(), which make it all more modular, and plays nice with the new functionality. 
- Adds a FOOOFGroup object: runs FOOOF across a matrix of PSDs. FOOOFGroup has it's own plots, prints, and report for eyeballing group level results. 
- Saving: added support for saving out / reading in settings / results and data from FOOOF objects. Uses JSON. Group also has easy 'save as you go', and load capacities, integrated into same FOOOF save calls. Can select what data to save out, and reconstruct FOOOF objects when loading back in (to be able to, for example, plot the model fits post-hoc). 
- Testing: cleaned, added more proper testing, with a 'smoke test' approach, as in: runs it all, will catch errors, total fit failures (miles of), but not strongly tested for accuracy.

Note:  for some relevant discussion on saving / JSON, and FOOOFGroup. 

Other Things I tried:
- I was going to add a way to re-load FOOOFResults into an object, to plot, etc, but realized that this mode of results export doesn't have enough info to fully reconstruct the model (basically: because it is missing the original gaussian params). Maybe we want to change that? Or, we consider (note) that FOOOFResult is a 'terminal' export - you can't fully reconstruct the model from it. 

Open Questions / Issues / ToDo:
- This basically covers my aims for v0.1 peripheral updates. There is perhaps some notes to be discussed (elsewhere) about knee fitting. Also, I don't think the saving procedure(s) are a silver bullet, so if anyone has thoughts / suggestions, now is the best time to sort them out. In particular:
	- The interplay/overlap of 'FOOOFResults', and the saving procedure. Yay? Nay? Keep both? Change? FOOOFResults as terminal? We have, potentially, two different ways for overlapping functionality here.
	- Does the JSON saving procedure play nice with Matlab? Is it a useful way to save out data to be loaded there? (If not, we should perhaps add something else to facilitate this). 
- There are probably a couple simple utils we can add for 'dealing with' resulting data (but they are also pretty easy to add on later). There are a couple helper function from omegamappin that would be nice/useful to ship with FOOOF, for basic data parsing / analysis. Then (but perhaps more of a v0.2 thing), we can add functionality to systematically compare between FOOOFGroups results.
- If everything here is friendly, then we just need to update the tutorial given these updates, tag & release. 

Status / User-Testing
- User testing: So I'm probably the worst user in terms of testing API, interface, useability, etc. Especially for the all the user-facing stuff here, it would be nice to get some sanity checks that it works / makes sense, so I recommend/ask that you pull this branch, and try it out a bit, let me know of any quirks with usability (any lurkers are encouraged to also do this :))

Almost v0.1 Ready!
- I might have gone a little overboard here, but I feel like the first proper release is probably a make or break point for getting people using it, and also sets up what we 'lock in', so (I think) worth pushing on these things now.
- With some sanity-check testing on all this here, and if nothing goes horribly wrong with all that, I vote that after review & merge we tag and push this out as a proper release.

FUN STATS:
- With this update, the FOOOF module is 540 lines of code, and 686 lines of comments / documentation, with an additional 193 lines of test code.
- 98% test coverage! Note: SMOKE TEST approach though, so it's not strictly tested for accuracy.
- Should be PEP-8 compliant, with only minor exceptions (and line length of 100).

tl-dr:
- Added some stuff. @voytek: lets meet, I can demo it all to sanity check, and we can decide if it's ready to merge and then tag for release from here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e040a07342ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.