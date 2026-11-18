# Issue

**Title:** Organize CLI arguments into groups

## Description

Closes none.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Remove extra step to distinguish required and optional arguments.
- Divide arguments into groups.

Here's what the CLI helps look like. I think we can adjust the groups, but I'm overall quite happy with it.

## tedana

```
usage: tedana [-h] -d FILE [FILE ...] -e TE [TE ...] [--out-dir PATH] [--prefix PREFIX] [--convention {orig,bids}] [--no-reports] [--png-cmap PNG_CMAP] [--verbose] [--overwrite] [--mask FILE]
              [--masktype {dropout,decay,none} [{dropout,decay,none} ...]] [--dummy-scans INT] [--fittype {loglin,curvefit}] [--combmode {t2s}] [--t2smap FILE] [--tedpca TEDPCA] [--tree TREE]
              [--external FILE] [--ica-method {robustica,fastica}] [--seed INT] [--n-robust-runs [5-500]] [--maxit INT] [--maxrestart INT] [--mix FILE] [--n-independent-echos INT] [--tedort]
              [--gscontrol {mir,gsr} [{mir,gsr} ...]] [--lowmem] [--n-threads INT] [--debug] [-v]

options:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit

Required Arguments:
  -d FILE [FILE ...]    Multi-echo dataset for analysis. A set of echo-specific files in ascending order. The TEs of the data should match the TEs listed in the -e argument. (default: None)
  -e TE [TE ...]        Ascending echo times in seconds (per BIDS convention). E.g., 0.015 0.039 0.063. Millisecond values (e.g., 15.0 39.0 63.0) are still accepted but deprecated. (default:
                        None)

Output Control:
  --out-dir PATH        Output directory. (default: .)
  --prefix PREFIX       Prefix for filenames generated. (default: )
  --convention {orig,bids}
                        Filenaming convention. "bids" will use the latest BIDS derivatives version. (default: bids)
  --no-reports          Disables creation of a figures folder with static component maps, timecourse plots, and other diagnostic images. Also disables the generation of a dynamic report.
                        (default: False)
  --png-cmap PNG_CMAP   Colormap for figures. (default: coolwarm)
  --verbose             Generate intermediate and additional files. (default: False)
  --overwrite, -f       Force overwriting of files. (default: False)

Temporal and Spatial Masking:
  --mask FILE           Binary mask of voxels to include in TE Dependent ANAlysis. Must be in the same space as `data`. If an explicit mask is not provided, then Nilearn's compute_epi_mask
                        function will be used to derive a mask from the first echo's data. Providing a mask is recommended. (default: None)
  --masktype {dropout,decay,none} [{dropout,decay,none} ...]
                        Method(s) by which to define the adaptive mask. The adaptive mask starts with the mask from '--mask', when provided. It identifies voxels that have good data in all vs a
                        subset of echoes. "dropout" removes voxels with much lower voxels than other voxels within each echo. "decay" removes voxels where the raw signal does not decay across
                        echoes. Users can specify one, both, or neither of the models. (default: ['dropout'])
  --dummy-scans INT     Number of dummy scans to remove from the beginning of the data. (default: 0)

Decay Model Fitting and Optimal Combination:
  --fittype {loglin,curvefit}
                        Desired T2*/S0 fitting method. "loglin" means that a linear model is fit to the log of the data. "curvefit" means that a more computationally demanding monoexponential
                        model is fit to the raw data. (default: loglin)
  --combmode {t2s}      Combination scheme for TEs: "t2s" (Posse 1999) (default: t2s)
  --t2smap FILE         Precalculated T2* map in the same space as the input data. Values should be in seconds (per BIDS convention). Maps in milliseconds are auto-detected and handled with a
                        warning. (default: None)

Component Selection:
  --tedpca TEDPCA       Method by which to select number of components in TEDPCA. This can be one of the following: String ("mdl", "kic", "aic", "kundu", or "kundu-stabilize"); floating-point
                        value in the range (0.0, 1.0); positive integer value. PCA decomposition with the mdl, kic and aic options are based on a Moving Average (stationary Gaussian) process,
                        and are ordered from most to least aggressive. "kundu" or "kundu-stabilize" are legacy selection methods that were distributed with MEICA. Floating-point inputs select
                        components based on the cumulative variance explained. Integer inputs select the specified number of components. Default: "aic". (default: aic)
  --tree TREE           Decision tree to use. You may use a packaged tree (tedana_orig, meica, minimal) or supply a JSON file which matches the decision tree file specification. Minimal still
                        being tested with more details in docs (default: tedana_orig)
  --external FILE       File containing external regressors to compare to ICA component be used in the decision tree. For example, to identify components fit head motion time series. The file
                        must be a TSV file with the same number of rows as the number of volumes in the input data. Column labels and statistical tests are defined with external_labels.
                        (default: None)
  --ica-method {robustica,fastica}, --ica_method {robustica,fastica}
                        The applied ICA method. "fastica" runs FastICA from sklearn once with the seed value. "robustica" will run FastICA n_robust_runs times and uses clustering methods to
                        overcome the randomness of the FastICA algorithm. "robustica" will be slower. (default: fastica)
  --seed INT            Value used for random initialization of ICA algorithm. Set to an integer value for reproducible ICA results. Set to -1 for varying results across ICA calls. This applies
                        to both fastica and robustica methods. (default: 42)
  --n-robust-runs [5-500], --n_robust_runs [5-500]
                        The number of times robustica will run. This is only effective when ica_method is set to robustica. (default: 30)
  --maxit INT           Maximum number of iterations for ICA. (default: 500)
  --maxrestart INT      Maximum number of attempts for ICA. If ICA fails to converge, the fixed seed will be updated and ICA will be run again. If convergence is achieved before maxrestart
                        attempts, ICA will finish early. (default: 10)
  --mix FILE            File containing mixing matrix. If not provided, ME-PCA & ME-ICA is done. (default: None)
  --n-independent-echos INT
                        Number of independent echoes to use in goodness of fit metrics (fstat). Primarily used for EPTI acquisitions, which have dependency across echoes. If not provided,
                        number of echoes will be used. (default: None)

Additional Denoising Options:
  --tedort              Orthogonalize rejected components w.r.t. accepted components prior to denoising. This is a conservative option where shared variance between accepted and rejected
                        components will be retained in the denoised data. (default: False)
  --gscontrol {mir,gsr} [{mir,gsr} ...]
                        Perform additional denoising to remove spatially diffuse noise. "gsr" regresses out the global signal of all voxels in the mask. "mir" is Minimum Image Regression with
                        the goal of reducing T1-like effects. The positive and negative effects of using these options are unclear. This argument can be a single value or a space-delimited
                        list. (default: )

Performance Control:
  --lowmem              Enables low-memory processing, including the use of IncrementalPCA. May increase workflow duration. (default: False)
  --n-threads INT       Number of threads to use. Used by threadpoolctl to set the parameter outside of the workflow function. Higher numbers of threads tend to slow down performance on typical
                        datasets. (default: 1)
  --debug               Logs in the terminal will have increased verbosity, and will also be written into a TSV file in the output directory. (default: False)
```

## t2smap

```
usage: t2smap [-h] -d FILE [FILE ...] -e TE [TE ...] [--out-dir PATH] [--prefix PREFIX] [--convention {orig,bids}] [--verbose] [--overwrite] [--mask FILE]
              [--masktype {dropout,decay,none} [{dropout,decay,none} ...]] [--dummy-scans INT] [--exclude EXCLUDE] [--fittype {loglin,curvefit}] [--fitmode {all,ts}] [--combmode {t2s,paid}]
              [--n-independent-echos INT] [--n-threads INT] [--debug] [-v]

options:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit

Required Arguments:
  -d FILE [FILE ...]    Multi-echo dataset for analysis. A set of echo-specific files in ascending order. The TEs of the data should match the TEs listed in the -e argument. (default: None)
  -e TE [TE ...]        Ascending echo times in seconds (per BIDS convention). E.g., 0.015 0.039 0.063. Millisecond values (e.g., 15.0 39.0 63.0) are still accepted but deprecated. (default:
                        None)

Output Control:
  --out-dir PATH        Output directory. (default: .)
  --prefix PREFIX       Prefix for filenames generated. (default: )
  --convention {orig,bids}
                        Filenaming convention. "bids" will use the latest BIDS derivatives version. (default: bids)
  --verbose             Generate intermediate and additional files. (default: False)
  --overwrite, -f       Force overwriting of files. (default: False)

Temporal and Spatial Masking:
  --mask FILE           Binary mask of voxels to include in TE Dependent ANAlysis. Must be in the same space as `data`. If an explicit mask is not provided, then Nilearn's compute_epi_mask
                        function will be used to derive a mask from the first echo's data. Providing a mask is recommended. (default: None)
  --masktype {dropout,decay,none} [{dropout,decay,none} ...]
                        Method(s) by which to define the adaptive mask. The adaptive mask starts with the mask from '--mask', when provided. It identifies voxels that have good data in all vs a
                        subset of echoes. "dropout" removes voxels with much lower voxels than other voxels within each echo. "decay" removes voxels where the raw signal does not decay across
                        echoes. Users can specify one, both, or neither of the models. (default: ['dropout'])
  --dummy-scans INT     Number of dummy scans to remove from the beginning of the data. (default: 0)
  --exclude EXCLUDE     Volume indices to exclude from adaptive mask generation and T2* and S0 estimation, but which will be retained in the optimally combined data. Can be individual indices
                        (e.g., '0,5,10'), ranges (e.g., '5:10'), or a mix of the two (e.g., '0,5:10,15'). Indices are 0-based. As in Python lists, ranges are start-inclusive and end-exclusive
                        (for example, '0:5' includes the first [0] through fifth [4] timepoints). Default is to not exclude any volumes. (default: None)

Decay Model Fitting and Optimal Combination:
  --fittype {loglin,curvefit}
                        Desired T2*/S0 fitting method. "loglin" means that a linear model is fit to the log of the data. "curvefit" means that a more computationally demanding monoexponential
                        model is fit to the raw data. (default: loglin)
  --fitmode {all,ts}    Monoexponential model fitting scheme. "all" means that the model is fit, per voxel, across all timepoints. "ts" means that the model is fit, per voxel and per timepoint.
                        (default: all)
  --combmode {t2s,paid}
                        Combination scheme for TEs: "t2s" (Posse 1999), "paid" (Poser) (default: t2s)

Component Selection:
  --n-independent-echos INT
                        Number of independent echoes to use in goodness of fit metrics (fstat). Primarily used for EPTI acquisitions, which have dependency across echoes. If not provided,
                        number of echoes will be used. (default: None)

Performance Control:
  --n-threads INT       Number of threads to use. Used by threadpoolctl to set the parameter outside of the workflow function. Higher numbers of threads tend to slow down performance on typical
                        datasets. (default: 1)
  --debug               Logs in the terminal will have increased verbosity, and will also be written into a TSV file in the output directory. (default: False)
```

## ica_reclassify

```
usage: ica_reclassify [-h] [--manacc INT [INT ...]] [--manrej INT [INT ...]] [--tagacc TAG [TAG ...]] [--tagrej TAG [TAG ...]] [--config CONFIG] [--out-dir PATH] [--prefix PREFIX]
                      [--convention {orig,bids}] [--no-reports] [--png-cmap PNG_CMAP] [--verbose] [-f] [--dummy-scans INT] [--tedort] [--gscontrol {gsr,mir} [{gsr,mir} ...]] [--n-threads INT]
                      [--debug] [-v]
                      FILE

options:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit

Required Arguments:
  FILE                  File registry from a previous tedana run.

Component Selection:
  --manacc INT [INT ...]
                        Component indices to accept (zero-indexed). Supply as a comma-delimited list with no spaces, as a csv file, or as a text file with an allowed delimiter ('\t', '\n', ' ',
                        ','). (default: [])
  --manrej INT [INT ...]
                        Component indices to reject (zero-indexed). Supply as a comma-delimited list with no spaces, as a csv file, or as a text file with an allowed delimiter ('\t', '\n', ' ',
                        ','). (default: [])
  --tagacc TAG [TAG ...]
                        Classification tag(s) to add to accepted components. Will be applied to all listed accepted components, even if they were already accepted. Supply a single tag or a
                        comma-delimited list. (default: [])
  --tagrej TAG [TAG ...]
                        Classification tag(s) to add to rejected components. Will be applied to all listed rejected components, even if they were already rejected. Supply a single tag or a
                        comma-delimited list. (default: [])

Output Control:
  --config CONFIG       File naming configuration. (default: auto)
  --out-dir PATH        Output directory. (default: .)
  --prefix PREFIX       Prefix for filenames generated. (default: )
  --convention {orig,bids}
                        Filenaming convention. "bids" will use the latest BIDS derivatives version. (default: bids)
  --no-reports          Disables creation of a figures folder with static component maps, timecourse plots, and other diagnostic images. Also disables the generation of a dynamic report.
                        (default: False)
  --png-cmap PNG_CMAP   Colormap for figures. (default: coolwarm)
  --verbose             Generate intermediate and additional files. (default: False)
  -f, --overwrite       Force overwriting of files. (default: False)

Temporal and Spatial Masking:
  --dummy-scans INT     Number of dummy scans to remove from the beginning of the data. (default: 0)

Additional Denoising Options:
  --tedort              Orthogonalize rejected components w.r.t. accepted components prior to denoising. This is a conservative option where shared variance between accepted and rejected
                        components will be retained in the denoised data. (default: False)
  --gscontrol {gsr,mir} [{gsr,mir} ...]
                        Perform additional denoising to remove spatially diffuse noise. "gsr" regresses out the global signal of all voxels in the mask. "mir" is Minimum Image Regression with
                        the goal of reducing T1-like effects. The positive and negative effects of using these options are unclear. This argument can be a single value or a space-delimited
                        list. (default: )

Performance Control:
  --n-threads INT       Number of threads to use. Used by threadpoolctl to set the parameter outside of the workflow function. Higher numbers of threads tend to slow down performance on typical
                        datasets. (default: 1)
  --debug               Logs in the terminal will have increased verbosity, and will also be written into a TSV file in the output directory. (default: False)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c5cd707d2c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.