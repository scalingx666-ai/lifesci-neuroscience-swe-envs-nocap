# Issue

**Title:** use add_dll_directory for python38

## Description

From the Python 3.8 release notes:

DLL dependencies for extension modules and DLLs loaded with ctypes on Windows are now resolved more securely. Only the system paths, the directory containing the DLL or PYD file, and directories added with add_dll_directory() are searched for load-time dependencies. Specifically, PATH and the current working directory are no longer used, and modifications to these will no longer have any effect on normal DLL resolution. If your application relies on these mechanisms, you should check for add_dll_directory() and if it exists, use it to add your DLLs directory while loading your library. Note that Windows 7 users will need to ensure that Windows Update KB2533623 has been installed (this is also verified by the installer).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `491f0ce99328`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.