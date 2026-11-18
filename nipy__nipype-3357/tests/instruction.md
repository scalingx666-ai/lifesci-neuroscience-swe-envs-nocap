# Issue

**Title:** [FIX] Also allow `errno.EBUSY` during `emptydirs` on NFS

## Description

<!--

Pull-request guidelines
-----------------------

1. If you would like to list yourself as a Nipype contributor and your name is not mentioned please modify .zenodo.json file.
2. By submitting this request you acknowledge that your contributions are available under the Apache 2 license.
3. Use a descriptive prefix for your PR: ENH (enhancement), FIX, TST, DOC, STY, REF (refactor), WIP (Work in progress)
4. Run `make check-before-commit` before submitting the PR.

-->
## Summary
<!-- Please reference any related issue and use fixes/close to automatically
close them, if pertinent -->

Running a workflow with nipype 1.6.1, I sometimes get the following exception:
```
│     Traceback (most recent call last):
│       File "/usr/local/miniconda/lib/python3.7/site-packages/halfpipe/plugins/multiproc.py", line 71, in run_node
│         result["result"] = node.run(updatehash=updatehash)
│       File "/usr/local/miniconda/lib/python3.7/site-packages/nipype/pipeline/engine/nodes.py", line 493, in run
│         emptydirs(outdir, noexist_ok=True)
│       File "/usr/local/miniconda/lib/python3.7/site-packages/nipype/utils/filemanip.py", line 794, in emptydirs
│         raise ex
│       File "/usr/local/miniconda/lib/python3.7/site-packages/nipype/utils/filemanip.py", line 781, in emptydirs                                                                                           │         shutil.rmtree(path)
│       File "/usr/local/miniconda/lib/python3.7/shutil.py", line 494, in rmtree
│         _rmtree_safe_fd(fd, path, onerror)
│       File "/usr/local/miniconda/lib/python3.7/shutil.py", line 452, in _rmtree_safe_fd
│         onerror(os.unlink, fullname, sys.exc_info())
│       File "/usr/local/miniconda/lib/python3.7/shutil.py", line 450, in _rmtree_safe_fd
│         os.unlink(entry.name, dir_fd=topfd)
│     OSError: [Errno 16] Device or resource busy: '.nfs0000000002273a940000254d'
│     During handling of the above exception, another exception occurred:
│     Traceback (most recent call last):
│       File "/usr/local/miniconda/lib/python3.7/concurrent/futures/process.py", line 239, in _process_worker
│         r = call_item.fn(*call_item.args, **call_item.kwargs)
│       File "/usr/local/miniconda/lib/python3.7/site-packages/halfpipe/plugins/multiproc.py", line 74, in run_node
│         result["result"] = node.result
│       File "/usr/local/miniconda/lib/python3.7/site-packages/nipype/pipeline/engine/nodes.py", line 217, in result
│         op.join(self.output_dir(), "result_%s.pklz" % self.name)
│       File "/usr/local/miniconda/lib/python3.7/site-packages/nipype/pipeline/engine/utils.py", line 291, in load_resultfile
│         raise FileNotFoundError(results_file)
│     FileNotFoundError
```
As far as I can tell, if a file on an NFS mount is still open somewhere, when it is deleted, NFS will rename that file to a hidden file ("placeholder") in the same directory so that the data stays available to the open file handle (according to <https://unix.stackexchange.com/a/348678>). When `shutil` discovers that hidden file, it will try to delete it, and we get an `OSError` with `errno.EBUSY`

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->

- [x] This pull request catches that error number in addition to `errno.ENOTEMPTY`, which is already handled by current code

## Acknowledgment

- [x] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7080ef9edd0f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.