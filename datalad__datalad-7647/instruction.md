# Issue

**Title:** ENH: Add information about __cause__ exception in the "exception" printout within result record and its short string version

## Description

Inspired by 

Before this change

    > datalad -l debug download-url shub://datalad/datalad-container:testhelper
    ...
    download_url(error): /home/yoh/.tmp/datalad_temp_test_container_files0tvyery_/ (file) [AccessFailedError(Failed to establish a new session 1 times. )] [Failed to establish a new session 1 times. ]
    [DEBUG  ] could not perform all requested actions: IncompleteResultsError(Command did not complete successfully. 1 failed:
    [{'action': 'download_url',
      'error_message': 'Failed to establish a new session 1 times. ',
      'exception': Failed to establish a new session 1 times.  [download_url.py:__call__:202,base.py:download:533,shub.py:access:50,shub.py:_resolve_url:39,base.py:fetch:643,shub.py:access:50,base.py:access:174,base.py:_fetch:589,http.py:get_downloader_session:633,http.py:get_downloader_session:618,sessions.py:get:602,sessions.py:request:589,sessions.py:send:703,adapters.py:send:517],
      'exception_traceback': '[download_url.py:__call__:202,base.py:download:533,shub.py:access:50,shub.py:_resolve_url:39,base.py:fetch:643,shub.py:access:50,base.py:access:174,base.py:_fetch:589,http.py:get_downloader_session:633,http.py:get_downloader_session:618,sessions.py:get:602,sessions.py:request:589,sessions.py:send:703,adapters.py:send:517]',
      'message': 'AccessFailedError(Failed to establish a new session 1 times. )',
      'path': '/home/yoh/.tmp/datalad_temp_test_container_files0tvyery_/',
      'status': 'error',
      'type': 'file'}])

so no information about actual problem is provided even in DEBUG output. With this change we get at least full record containing it:

    [DEBUG  ] could not perform all requested actions: IncompleteResultsError(Command did not complete successfully. 1 failed:
    [{'action': 'download_url',
      'error_message': 'Failed to establish a new session 1 times. ',
      'exception': Failed to establish a new session 1 times.  -caused by- HTTPSConnectionPool(host='singularity-hub.org', port=443): Max retries exceeded with url: /api/container/datalad/datalad-container:testhelper (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: certificate has expired (_ssl.c:1000)'))) [download_url.py:__call__:202,base.py:download:533,shub.py:access:50,shub.py:_resolve_url:39,base.py:fetch:643,shub.py:access:50,base.py:access:174,base.py:_fetch:589,http.py:get_downloader_session:633,http.py:get_downloader_session:618,sessions.py:get:602,sessions.py:request:589,sessions.py:send:703,adapters.py:send:517],
      'exception_traceback': '[download_url.py:__call__:202,base.py:download:533,shub.py:access:50,shub.py:_resolve_url:39,base.py:fetch:643,shub.py:access:50,base.py:access:174,base.py:_fetch:589,http.py:get_downloader_session:633,http.py:get_downloader_session:618,sessions.py:get:602,sessions.py:request:589,sessions.py:send:703,adapters.py:send:517]',
      'message': 'AccessFailedError(Failed to establish a new session 1 times. )',
      'path': '/home/yoh/.tmp/datalad_temp_test_container_files0tvyery_/',
      'status': 'error',
      'type': 'file'}])

I guess ideally we also should add it into `"error_message"` but first want to see what this would break if anything.

<details>
<summary>NB that `_with_cause` functionality seems to have only limited use and might need to be used more one way or another</summary> 

```shell
❯ git grep -p format.*with_cause | grep -v test_
datalad/cli/main.py=def _run_with_exception_handler(cmdlineargs):
datalad/cli/main.py:            lgr.error('%s', ce.format_with_cause())
datalad/customremotes/__init__.py=from annexremote import (
datalad/customremotes/__init__.py:from datalad.support.exceptions import format_exception_with_cause
datalad/customremotes/__init__.py=class RemoteError(_RemoteError):
datalad/customremotes/__init__.py:            exc_cause = format_exception_with_cause(exc_cause)
datalad/customremotes/datalad.py=class DataladAnnexCustomRemote(AnnexCustomRemote):
datalad/customremotes/datalad.py:                            f"{ce.format_with_cause()}"
datalad/customremotes/datalad.py:                error_causes.append(ce.format_with_cause())
datalad/support/exceptions.py=class CapturedException(object):
datalad/support/exceptions.py:    def format_with_cause(self):
datalad/support/exceptions.py:        return format_exception_with_cause(self.tb)
datalad/support/exceptions.py=def format_oneline_tb(exc, tb=None, limit=None, include_str=True):
datalad/support/exceptions.py:            out += f'-caused by- {format_exception_with_cause(exc_cause)} '
datalad/support/exceptions.py:def format_exception_with_cause(e):
datalad/support/exceptions.py:        s += f' -caused by- {format_exception_with_cause(exc_cause)}'
``` 
</details> 


Added 2nd commit for

  ENH: Add -caused by- into format_short
  
  It is necessary for various interface points to actually provide
  information about exception.  E.g. if used in conjunction with
  
  - 
  - /home/yoh/proj/misc/AnnexRemote
  
  then we would not only obtain although quite loaded but meaningful error
  result rendering:
  
      download_url(error): /tmp/ (file) [AccessFailedError(Failed to establish a new session 1 times. ) -caused by- HTTPSConnectionPool(host='singularity-hub.org', port=443): Max retries exceeded with url: /api/container/datalad/datalad-container:testhelper (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: certificate has expired (_ssl.c:1000)')))] [Failed to establish a new session 1 times. ]
  
  we would also make git-annex report the reason!:
  
      ❯ git annex  addurl shub://datalad/datalad-container:testhelper
      addurl shub://datalad/datalad-container:testhelper
        AccessFailedError(Failed to establish a new session 1 times. ) -caused by- HTTPSConnectionPool(host='singularity-hub.org', port=443): Max retries exceeded with url: /api/container/datalad/datalad-container:testhelper (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: certificate has expired (_ssl.c:1000)')))
      failed
      addurl: 1 failed

so even without adjustment of `error_message` we then tunnel information nicely all the way into git annex.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0b67ec44f9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.