# Issue

**Title:** FIX: Retry renaming pkl(z) files on fail

## Description

@shashankbansal6 ran into an issue on TACC:

```
exception calling callback for <Future at 0x2ab460e40490 state=finished raised FileNotFoundError>
concurrent.futures.process._RemoteTraceback: 
"""
Traceback (most recent call last):
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/site-packages/nipype/pipeline/plugins/multiproc.py", line 67, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/site-packages/nipype/pipeline/engine/nodes.py", line 512, in run
    savepkl(op.join(outdir, "_node.pklz"), self)
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/site-packages/nipype/utils/filemanip.py", line 721, in savepkl
    os.rename(tmpfile, filename)
FileNotFoundError: [Errno 2] No such file or directory: '/scratch1/06850/sbansal6/ds001734-workdir/nistats_smooth/fitlins_wf/loader/_node.pklz.tmp' -> '/scratch1/06850/sbansal6/ds001734-workdir/nistats_smooth/fitlins_wf/loader/_node.pklz'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/concurrent/futures/process.py", line 239, in _process_worker
    r = call_item.fn(*call_item.args, **call_item.kwargs)
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/site-packages/nipype/pipeline/plugins/multiproc.py", line 70, in run_node
    result["result"] = node.result
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/site-packages/nipype/pipeline/engine/nodes.py", line 216, in result
    return _load_resultfile(
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/site-packages/nipype/pipeline/engine/utils.py", line 291, in load_resultfile
    raise FileNotFoundError(results_file)
FileNotFoundError: /scratch1/06850/sbansal6/ds001734-workdir/nistats_smooth/fitlins_wf/loader/result_loader.pklz
"""

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/concurrent/futures/_base.py", line 328, in _invoke_callbacks
    callback(self)
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/site-packages/nipype/pipeline/plugins/multiproc.py", line 159, in _async_callback
    result = args.result()
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/concurrent/futures/_base.py", line 437, in result
    return self.__get_result()
  File "/work/06850/sbansal6/frontera/miniconda3/envs/fitlins38_2/lib/python3.8/concurrent/futures/_base.py", line 389, in __get_result
    raise self._exception
FileNotFoundError: /scratch1/06850/sbansal6/ds001734-workdir/nistats_smooth/fitlins_wf/loader/result_loader.pklz
```

Looking at the full error, we get this 7 times, which makes me worry that we're somehow getting a race condition where each worker is actually trying to run the same node, which is not mapped. But this patch should at least catch if it's a filesystem issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae1e03396578`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.