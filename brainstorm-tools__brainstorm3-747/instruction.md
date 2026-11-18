# Issue

**Title:** Plugins: Update iso2mesh to 1.9.8, adds support for ARM macOS

## Description

This PR updates the plugins for the ARM Mac: 

- iso2mesh to 1.9.8
A new version of iso2mesh was released last week by @fangq notably adding the support for arm computer. 
The details of the changes can be seen here: https://github.com/fangq/iso2mesh/releases/tag/v1.9.8 
This updates the plugin version of iso2mesh to this new release. 


- xdf to master. 
xdf is now working on ARM Mac.  (see )

- Improve the support of conflict between plugins

We are very close to having all the plugins working for Mac with only Duneuro not being compatible.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdc3f633ffa2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.