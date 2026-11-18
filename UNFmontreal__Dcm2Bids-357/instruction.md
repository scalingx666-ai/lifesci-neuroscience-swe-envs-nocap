# Issue

**Title:** ==[FIX]==  OS level timeout in check_github_latest()

## Description

If there's a socket Timeout urllib doesn't catch it with HTTPError or URLError.
If running in a container at a location with network issues or bad internet this causes the bidsification to fail for a subject. 
I was running dcm2bids 3.2.0 via `nipoppy bidsify` and getting intermittent failures. 
I Was able to complete all bidsification by re-running. 

The solution I have is to add Timeout catch to the `check_github_latest` function. 

```bash
[2026-01-15 13:16:49] INFO    [RUN STDOUT] INFO    | OS version: Linux-6.17.3-zabbly+-x86_64-with-glibc2.36
[2026-01-15 13:16:49] INFO    [RUN STDOUT] INFO    | Python version: 3.12.3 | packaged by conda-forge | (main, Apr 15 2024, 18:38:13) [GCC 12.3.0]
[2026-01-15 13:16:49] INFO    [RUN STDOUT] INFO    | dcm2bids version: 3.2.0
[2026-01-15 13:16:49] INFO    [RUN STDOUT] INFO    | dcm2niix version: v1.0.20240202
[2026-01-15 13:16:49] INFO    [RUN STDOUT] INFO    | Checking for software update
[2026-01-15 13:16:49] INFO    [RUN STDOUT] INFO    | Currently using the latest version of dcm2bids.
[2026-01-15 13:16:49] INFO    [RUN STDOUT] Traceback (most recent call last):
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/bin/dcm2bids", line 8, in <module>
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     sys.exit(main())
[2026-01-15 13:16:49] INFO    [RUN STDOUT]              ^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/dcm2bids/dcm2bids/cli/dcm2bids.py", line 124, in main
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     check_latest("dcm2niix")
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/dcm2bids/dcm2bids/utils/tools.py", line 85, in check_latest
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     latest = check_github_latest(repo)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]              ^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/dcm2bids/dcm2bids/utils/tools.py", line 41, in check_github_latest
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     response = request.urlopen(req, timeout=timeout)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/urllib/request.py", line 215, in urlopen
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     return opener.open(url, data, timeout)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/urllib/request.py", line 515, in open
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     response = self._open(req, data)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]                ^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/urllib/request.py", line 532, in _open
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     result = self._call_chain(self.handle_open, protocol, protocol +
[2026-01-15 13:16:49] INFO    [RUN STDOUT]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/urllib/request.py", line 492, in _call_chain
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     result = func(*args)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]              ^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/urllib/request.py", line 1392, in https_open
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     return self.do_open(http.client.HTTPSConnection, req,
[2026-01-15 13:16:49] INFO    [RUN STDOUT]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/urllib/request.py", line 1348, in do_open
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     r = h.getresponse()
[2026-01-15 13:16:49] INFO    [RUN STDOUT]         ^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/http/client.py", line 1428, in getresponse
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     response.begin()
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/http/client.py", line 331, in begin
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     version, status, reason = self._read_status()
[2026-01-15 13:16:49] INFO    [RUN STDOUT]                               ^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/http/client.py", line 292, in _read_status
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     line = str(self.fp.readline(_MAXLINE + 1), "iso-8859-1")
[2026-01-15 13:16:49] INFO    [RUN STDOUT]                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/socket.py", line 707, in readinto
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     return self._sock.recv_into(b)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]            ^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/ssl.py", line 1252, in recv_into
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     return self.read(nbytes, buffer)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]            ^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT]   File "/venv/lib/python3.12/ssl.py", line 1104, in read
[2026-01-15 13:16:49] INFO    [RUN STDOUT]     return self._sslobj.read(len, buffer)
[2026-01-15 13:16:49] INFO    [RUN STDOUT]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[2026-01-15 13:16:49] INFO    [RUN STDOUT] TimeoutError: The read operation timed out
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77845ab91174`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.