# Issue

**Title:** BF: Add retry logic for 5xx server errors in HTTP downloads

## Description

Downloads would fail immediately on transient server errors like 503 Service Unavailable. Now AccessFailedError with 5xx status codes are retried up to 5 times with exponential backoff (same pattern as 429 handling).

🤖 Generated with [Claude Code](https://claude.com/claude-code)



Originally observed in tests failure somewhere on CI and seeing

    FAILED ../datalad/distributed/tests/test_ria_basics.py::test_binary_data - datalad.support.exceptions.IncompleteResultsError: Command did not complete successfully. 1 failed:
    [{'action': 'download_url',
      'error_message': 'Access to '
                       'https://github.com/datalad/example-dicom-functional/blob/master/dicoms/MR.1.3.46.670589.11.38317.5.0.4476.2014042516042547586 '
                       'has failed: status code 503',
      'exception': Access to https://github.com/datalad/example-dicom-functional/blob/master/dicoms/MR.1.3.46.670589.11.38317.5.0.4476.2014042516042547586 has failed: status code 503
    [download_url.py:__call__:202,base.py:download:538,base.py:access:179,base.py:_download:438,http.py:get_downloader_session:649,http.py:check_response_status:150],
      'exception_traceback': '[download_url.py:__call__:202,base.py:download:538,base.py:access:179,base.py:_download:438,http.py:get_downloader_session:649,http.py:check_response_status:150]',
      'message': 'datalad.support.exceptions.AccessFailedError(Access to '
                 'https://github.com/datalad/example-dicom-functional/blob/master/dicoms/MR.1.3.46.670589.11.38317.5.0.4476.2014042516042547586 '
                 'has failed: status code 503)',
      'path': '/tmp/datalad_temp__test_binary_data9d20av0q/dicomfile',
      'status': 'error',
      'type': 'file'}]
    = 1 failed, 1265 passed, 50 skipped, 5 xfailed, 1 xpassed, 2 warnings in 1499.65s (0:24:59) =

so it was 503 from github

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `30ff569bf98b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.