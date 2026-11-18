# Issue

**Title:** [FIX] Sanitize plus signs in from entities in workflow names

## Description

<!--
Text in these brackets are comments, and won't be visible when you submit your pull request.
If this is your first contribution, please take the time to read these, in particular the comment
beginning "Welcome, new contributors!".
-->

## Changes proposed in this pull request

<!--
Please describe here the main features / changes proposed for review and integration in fMRIPrep
If this PR addresses some existing problem, please use GitHub's citing tools
(eg. ref #, closes # or fixes #).
If there is not an existing issue open describing the problem, please consider opening a new
issue first and then link it from here (so the *fMRIPrep* community has a better understanding
of ongoing development efforts and possible overlaps between contributions).
-->

Sanitize + char , now part of the BIDS spec , for instance in `acq` or `task` entities. 

https://bids-specification.readthedocs.io/en/stable/glossary.html#label-formats 

Without that fix, any use of + sign results in the following traceback

```
fmriprep/workflows/tests/test_base.py:271:
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
fmriprep/workflows/base.py:108: in init_fmriprep_wf
    single_subject_wf = init_single_subject_wf(subject_id, sessions, name=wf_name)
fmriprep/workflows/base.py:871: in init_single_subject_wf
    bold_wf = init_bold_wf(
fmriprep/workflows/bold/base.py:191: in init_bold_wf
    workflow = Workflow(name=_get_wf_name(bold_file, 'bold'))
../niworkflows/niworkflows/engine/workflows.py:47: in __init__
    super().__init__(name, base_dir)
../../../../.virtualenvs/nipreps_dev/lib/python3.10/site-packages/nipype/pipeline/engine/workflows.py:58: in __init__
    super().__init__(name, base_dir)
../../../../.virtualenvs/nipreps_dev/lib/python3.10/site-packages/nipype/pipeline/engine/base.py:35: in __init__
    self.name = name
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

self = <[AttributeError("'LiterateWorkflow' object has no attribute '_id'") raised in repr()] LiterateWorkflow object at 0x79804fed4f40>
name = 'bold_task-rest_run-1_acquisition-mb4+pf68th_wf'

    @name.setter
    def name(self, name):
        if not name or not re.match(r"^[\w-]+$", name):
>           raise ValueError('[Workflow|Node] name "%s" is not valid.' % name)
E           ValueError: [Workflow|Node] name "bold_task-rest_run-1_acquisition-mb4+pf68th_wf" is not valid.
```

## Documentation that should be reviewed
<!--
Please summarize here the main changes to the documentation that the reviewers should be aware of.
-->
NA


<!--
Welcome, new contributors!

We ask you to read through the Contributing Guide:
https://github.com/nipreps/fmriprep/blob/master/CONTRIBUTING.md

These are guidelines intended to make communication easier by describing a consistent process, but
don't worry if you don't get it everything exactly "right" on the first try.

To boil it down, here are some highlights:

1) Consider starting a conversation in the issues list before submitting a pull request. The discussion might save you a
   lot of time coding.
2) Please use descriptive prefixes in your pull request title, such as "ENH:" for an enhancement or "FIX:" for a bug fix.
   (See the Contributing guide for the full set.) And consider adding a "WIP" tag for works-in-progress.
3) Any code you submit will be licensed under the same terms (Apache License 2.0) as the rest of fMRIPrep.
4) We invite every contributor to add themselves to the `.zenodo.json` file
   (https://github.com/nipreps/fmriprep/blob/master/.zenodo.json), which will result in your being listed as an author
   at the next release. Please add yourself as the next-to-last entry, just above Russ.

A pull request is a conversation. We may ask you to make some changes before accepting your PR,
and likewise, you should feel free to ask us any questions you have.

-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1e486e754dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.