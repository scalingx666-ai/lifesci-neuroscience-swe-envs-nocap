# Issue

**Title:** [Project sources] Allow to specify target study

## Description

Hello, 

This PR is here to allow specifying the target study when using bst_project_source from a script. 

Here is an example script we did today that could benefit from that. A map is imported in a group subject, then projected to another subject using bst_project_source. The modification allows nicely specifying the condition the map appears to.


```matlab
left_map    = 'L.func.gii';
right_map   = 'R.func.gii';

target_subject      = 'PXXXX';
target_condition    = 'hubness-zscore';

DisplayUnits = 'zscore';


% 0. Get Map name
[~, name, ext]  = fileparts(left_map);
name            = strrep(name, 'L.func', 'LR.func');

% Step 1. Import both texture to group
sSubject = bst_get('Subject', 'Group');
FSLR_5k = sSubject.Surface(strcmp({sSubject.Surface.Comment}, 'fsLR-5k.LR.surf'));

iStudies = db_add_condition('Group', sprintf('sub-%s',target_subject));
[OutputFile, errorMsg] = import_sources(iStudies, FSLR_5k.FileName, left_map, right_map, 'GII', name, DisplayUnits);

% Step 2. Project to subject
sSubject = bst_get('Subject', target_subject);
sCortex = sSubject.Surface(strcmp({sSubject.Surface.Comment}, 'mid_8002V'));


iStudies = db_add_condition(target_subject, target_condition);
sMaps = bst_project_sources( {OutputFile}, sCortex.FileName, 0, 0, iStudies);

```

  
  
   
---------------

Hs: it might be nice to be able to do the import directly from GUI. Right now, import_source cannot identify the left-/right maps because micapipe output name them XXX.L.YYY.gii; for example: "fsLR-5k.L.inflated.surf.gii" and "fsLR-5k.R.inflated.surf.gii"

would it be possible to include such naming schemes in https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/io/import_sources.m#L117-L118 ? 


cc: @adascal1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `172a5ac32aae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.