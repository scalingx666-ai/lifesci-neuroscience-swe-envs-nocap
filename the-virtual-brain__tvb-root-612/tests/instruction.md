# Issue

**Title:** TVB-2975 Update documentation

## Description

Update docs sections:
	- Data structure:
		- update screenshot for project data structure
		- delete section about graph view
	- Connectivity:
		- update connectivity area screenshot
		- update large scale connectivity screenshot
	- New screenshot for "Preview for Simulator Area"
	- Simulation History:
		- upload and export now refers to ZIP file instead of JSON file;
		- new screenshot for "Simulator editing menu" which has now export of ZIP file instead of JSON
		- new explanation for ZIP export. 
		- delete explanation for JSON export (functionality no longer exists)
	- Configure a Simulation:
		- new screenshots reflecting the actual workflow in configuration steps
		- new explanations for the actual workflow in configuration steps

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d525df00faf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.