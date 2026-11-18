# Issue

**Title:** Minor fixes

## Description

Hello all,

This PR includes a few minor fixes/changes that we've been running locally and hopefully others may find helpful.

As always, your comments are welcome.

Overview:

1) aamod_firstlevel_contrasts

- fixed eachagainstbaseline

- modified the efficiency plot to try to get it to give nicer looking results
regardless of how many contrasts are defined (the current code assumes
no more than 20; we routinely have 3x that many in item analysis). The 
code changes are straightforward -- mostly just decreasing font sizes 
according to how many contrasts there are. It's working for the test cases 
I've run but there probably isn't a universal solution that will display perfect 
in every case. However, I still think its an improvement.

2) aas_runfslcommand

- Matlab does this weird thing under OS-X where it sometimes doesn't inherit all
of $PATH on startup and runfslcommand crashes because aa can't find FSL (even though
FSL runs fine from a shell). I hacked a workaround into the ENV variable. 

- I added zsh to the bash case -- AFAIK, syntax for the two is identical
so the setup for bash should work for zsh.

3) aas_processBIDS.m 

- I added an optional trial_type filter so you can pass a regexp to select a subset
of event types  that are defined in the tsv. We need this for some modeling we're doing.

4) aa_export_toBIDS.m

- handle incoming subject identifiers less than four characters in length

5) aamod_secondlevel_contrasts.m

- save/restore wd on entry/exit

6) aamod_reorienttomiddle_epi.xml

- added a comment to the header noting the module in effect does a
crude reorienttomiddle. We got burned by this because we assumed
the module applied the same translation across all frames. it doesn't,
but there's no easy way to change that. Or maybe that's what people
want? Either way, the header should at least document the behavior. 

- also removed aamod_reorienttomiddle_epi from the tutorial script.

7) aamod_firstlevel_threshold.m, aamod_secondlevel_threshold.m

- tweaked the arrayfun calls so they work on older (< R2018b) Matlab versions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f84a0a7b622`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.