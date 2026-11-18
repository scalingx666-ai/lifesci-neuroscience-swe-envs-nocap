# Issue

**Title:** runtime config clean

## Description

Clean rebase of #245 by @zeyus

Original PR: 

Which was itself a redo of  but from a dedicated branch and targeting `cboulay/apple_framework`

> On non-desktop platforms, often apps are sandboxed and don't have (read/write) access at all to $HOME, /etc/ or even the current working directory. These paths may not exist.
> 
> In addition, environment variables don't necessarily make a lot of sense in the context of a mobile app, and the application data paths might contain GUIDs or other aspects of the path that make it difficult to determine at compile-time.
> 
> This PR adds the ability to set a configuration file path for liblsl provided that the static member function lsl_set_config_filename is called before any other LSL function.
> 
> In addition, there's also an option to read config directly from a string stream via set_api_config_content which is loaded into the INI and discarded.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `787988ef1d61`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.