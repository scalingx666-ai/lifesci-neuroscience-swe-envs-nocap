# Issue

**Title:** FIX: Add truncated dseg.tsv files for validation

## Description

Using the ds000001-fmriprep dataset for testing the new schema-based validator, we currently get:

```console
  ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
  │ ds000001-fmriprep                                                                                                                 │
  └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    NOT_INCLUDED                               .SKIP_VALIDATION                                                                        
                                                                                                                                       
    TSV_COLUMN_MISSING                         desc-aparcaseg_dseg.tsv                    Columns cited as index columns not in        
                                                                                          file: index.                                 
                                                                                          schema.rules.tabular_data.derivatives.co     
                                                                                          mmon_derivatives.SegmentationLookup          
                                                                                                                                       
    JSON_KEY_REQUIRED                          sub-10_desc-aparcaseg_dseg.nii.gz          missing SkullStripped as per                 
                                                                                          schema.rules.sidecars.derivatives.common     
                                                                                          _derivatives.ImageDerivatives                
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `874de6a9b5da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.