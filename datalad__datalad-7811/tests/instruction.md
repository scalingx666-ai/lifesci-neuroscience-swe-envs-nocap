# Issue

**Title:** ENH: config option to skip files open for writing during `datalad save`

## Description

Add datalad.save.skip-openfiles config (none/skip/warning/error) to detect and optionally exclude files held open for writing by other processes.  Uses psutil (added to misc optional deps) to enumerate open file descriptors and filter by write mode.

New module datalad.support.openfiles provides get_files_open_for_writing() which resolves symlinks and excludes the caller's own process tree. GitRepo._check_for_openfiles() integrates this into save_() following the same pattern as the existing Windows-compat check.



Original problem aimed to be solved described in

- https://git-annex.branchable.com/bugs/assistant__58___nothing_added_to_commit_but_untracked/

and is needed for automating of data logistics for ReproNim's ReproStim project. Aiming to use as

    datalad -c datalad.save.skip-openfiles=skip save -m "Saving all recently captured files" \
    && git annex sync

Additionally it introduces a helper  `python -m datalad.support.openfiles .` which I was not sure we should pollute CLI ATM with but which could come handy when needed.

### PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet (add the `CHANGELOG-missing` label to this pull request in order to have a snippet generated from its title;
  or use `scriv create` locally and include the generated file in the pull request, see [scriv](https://scriv.readthedocs.io/)).
- [x] by default - currently the same old behavior of committing everything, including open files.  
   - We could have changed to `warn` or even `error` to make operation more robust but it might be extra run time penalty and then require psutil to be core dependency. For now decided to keep consistent with current behavior

Thanks for contributing!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bda6f0d87cdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.