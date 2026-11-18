# Issue

**Title:** PR: Update serve-directory.py for better flexilibility and CORS warnings

## Description

Hi Tom,

Updates to the `serve-directory.py` are listed below:

### CORS Request Handler (`CORSRequestHandler`)
* Implements the `do_OPTIONS` method to handle preflight requests, responding with a 200 OK status.
* Adds `Access-Control-Allow-Methods` (`GET, OPTIONS`) and `Access-Control-Allow-Headers` (`Content-Type`) to all response headers.

### Server Class (`Server`)
* Checks for the existence of both the certificate and key files using `os.path.isfile` and raises `FileNotFoundError` if either is not found.
### Execution (`main`)
* The script includes a `try/except ImportError` block to ensure compatibility with both Python 2 and Python 3 HTTP server modules.
* Command-line argument parsing is updated to support the following structures:
    * `<port>` 
    * `<port> <cert-file> <key-file>`
    * `<port> <cert-file> <key-file> <directory>` for serving a specific directory.
* The script changes the current working directory to the target `serve_dir` via `os.chdir()` before starting the server.

Best,
Samia

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5abe45025727`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.