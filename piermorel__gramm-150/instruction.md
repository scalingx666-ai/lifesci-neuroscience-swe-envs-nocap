# Issue

**Title:** Use ExampleDrivenTester to smoke test gramm via buildtool

## Description

This PR updates the buildfile to use multiple example files to smoke test the toolbox instead of relying on a single example file.

- The buildtool now smoke tests the component using the multiple example files introduced in the previous PR (#142). Test reports and code‑coverage reports are generated as part of the buildtool workflow.

- This PR removes the existing "test" task that used a single example file and replaces it with "runExample" task.

- [ExampleDrivenTester](https://in.mathworks.com/matlabcentral/fileexchange/156374-examplesdriventester) would be a new dependency for gramm, available via the MATLAB Add‑On Manager.

- The CI workflow (.github/workflows/matlab.yml) has been updated to explicitly install this add‑on before running the build, ensuring the dependency is available in CI .

Issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48b178314d83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.