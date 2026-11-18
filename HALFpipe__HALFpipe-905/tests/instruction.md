# Issue

**Title:** fix anat_fit_wf_hierarchy bug

## Description

Fixing a bug in Factory get_hierarchy method causing a bug when there are more sessions.
```
[2025-11-18 15:03:01,0813] [halfpipe        ] [ERROR    ] Exception: list index out of range
│ Traceback (most recent call last):
│   File "/opt/conda/envs/fmriprep/lib/python3.12/site-packages/halfpipe/cli/run.py", line 346, in main
│     run(opts, should_run)
│   File "/opt/conda/envs/fmriprep/lib/python3.12/site-packages/halfpipe/cli/run.py", line 298, in run
│     run_stage_workflow(opts)
│   File "/opt/conda/envs/fmriprep/lib/python3.12/site-packages/halfpipe/cli/run.py", line 66, in run_stage_workflow
│     workflow = init_workflow(opts.workdir, spec_path=opts.spec_path, bids_database_dir=opts.bids_database_dir)
│                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
│   File "/opt/conda/envs/fmriprep/lib/python3.12/site-packages/halfpipe/workflows/base.py", line 115, in init_workflow
│     fmriprep_bold_file_paths = fmriprep_factory.setup(
│                                ^^^^^^^^^^^^^^^^^^^^^^^
│   File "/opt/conda/envs/fmriprep/lib/python3.12/site-packages/halfpipe/workflows/fmriprep.py", line 316, in setup
│     self.connect(hierarchy, inputnode, subject_id=subject_id)
│   File "/opt/conda/envs/fmriprep/lib/python3.12/site-packages/halfpipe/workflows/fmriprep.py", line 462, in connect
│     while (anat_fit_wf := anat_fit_wf_hierarchy[-1].get_node("anat_fit_wf")) is None:
│                           ~~~~~~~~~~~~~~~~~~~~~^^^^
└─IndexError: list index out of range
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32f0c1e41430`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.