# Issue

**Title:** Events: Add support for HED tags

## Description

Combined past HED tagging branches.
(Developed by @anna-zai1 and @rcassani)

HED integration in the GUI include:

- [x] Menu entry in the Record tab > Events > **Show HED tags**
  Opens a window with text showing all the HED tags for each event

- [x] Menu entry in the Record tab > Events > **Edit HED tags with CTagger**
  Calls [CTagger](https://github.com/hed-standard/CTagger) with the current events, and user can edit, validate and save their HED tags.  ~~Then the new HED tags get validated with [HED MATLAB Tools](https://github.com/hed-standard/hed-matlab) as the validation button on CTagger is not working. See this issue: 
  
  CTagger ~~and HED MATLAB Tools~~ are integrated to Brainstorm as a plugins

- [x] Menu entry in the Record tab > Events > **Uniform HED tags in protocol**
  This will look across files for all the HED tags linked to an Event, and will set those tags to all files in the Protocol. 
  This action can be performed also as a process: `process_evt_uniformhed()`

- [x] Menu entry in the Record tab > File > **Import HED tags from File**
  Reads the `_events.json` sidecar and adds the HED tags to the Events in Brainstorm (matching by name) 

- [x] Menu entry in the Record tab > File > **Export HED tags to File** 
  Creates the `_events.json` with the HED tags for the Events in Brainstorm.
  
- [x] Process to select files using HED tags in the Events in those files

- [x] HED tags are imported automatically when importing BIDS dataset

- [x] Tutorial page: https://neuroimage.usc.edu/brainstorm/Tutorials/HedTags

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a9580f81b02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.