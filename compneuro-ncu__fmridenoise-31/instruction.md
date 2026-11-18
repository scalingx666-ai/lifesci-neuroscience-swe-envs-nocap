# Issue

**Title:** Ica aroma fix #30

## Description

I was still getting an "ICA-Aroma file not found" error with the current fix outlined in #30. Because the following lines of code in interfaces/denooising.py was still running: 

```
        if pipeline_aroma:
            if not self.inputs.fmri_prep_aroma:
                raise ValueError("No ICA-AROMA files found")
```

This fix adds the following lines to parse_pipeline function entails that ICA-AROMA pipelines are excluded from the entire analysis.

```
        elif pipelines_args == 'all' and use_aroma == False: 
            return set([p for p in get_pipelines_paths() if 'ICA-AROMA' not in p])
```

This solved my issue at least. Hope it helps!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6ef7d2a1742`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.