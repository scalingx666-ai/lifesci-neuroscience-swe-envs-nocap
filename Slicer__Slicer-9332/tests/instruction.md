# Issue

**Title:** PERF: Parallel file prefetching at startup

## Description

This pull request implements parallel prefetching of libraries, which makes application startup about 5 seconds faster on Windows.

At application startup, thousands of files are read from disk and some go through heavy processing (e.g., libraries are scanned for malware before being loaded). This is mostly done on a single thread, without saturating disk and CPU resources.

This commit adds a file prefetcher component that reads a list of files from disk in parallel, to make loading of those files later during startup faster.

On Windows the first time a shared library is mapped after it has been created or modified (which includes the first launch after an installation and the first after a reboot), the Microsoft Defender anti-malware filter scans the whole file before the mapping completes. The scan is CPU bound and far outweighs the read. The loader maps libraries one at a time, on the thread that needs them, so the scans are serialized even though the scanning service can run them in parallel. Therefore, on Windows, prefetching all shared library files in parallel makes the cold application startup (i.e., after a reboot) up to about 5-10 seconds faster. Therefore, prefetching is enabled by default on Windows.

The same mechanism on macOS, only results in modest improvement (about 0.4 seconds), because malware and signature scanning only happens once, after installation. The operating system checks all signatures on a single thread, so making this operation parallel does not decrease the startup time. Therefore, prefetching is disabled by default on macOS.

There has been no thorough testing on Linux, but it seems that library loading is supposed to be already fast on Linux, so significant startup speed improvement is only expected in certain environments (e.g., slow network drives). Therefore, prefetching is disabled by default on Linux.

Whole files are read rather than a prefix, and read rather than mapped as data files, because reading just the first 1MB of the files or loading them as libraries did not improved the speed.

List of files to be prefetched is determined by recording the list of loaded libraries at each startup and storing it in a file. Therefore libraries needed by Slicer extensions, Python packages, and Qt plugins are all covered. The list lives beside the revision-specific settings file, which is the application's existing answer to where an installation may write, so an installation in a read-only directory can still refresh it.

What the prefetch did is added to the --report-startup-timing report.

Two environment variables can adjust the behavior. SLICER_STARTUP_FILE_PREFETCH can force enable/disable library prefetch by setting it to 1 or 0. SLICER_STARTUP_FILE_PREFETCH_THREADS can set a maximum number of threads that may prefetch the files.

The file prefetching mechanism can be excluded from the build by setting Slicer_BUILD_STARTUP_FILE_PREFETCH CMake variable to OFF.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba8acd5774a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.