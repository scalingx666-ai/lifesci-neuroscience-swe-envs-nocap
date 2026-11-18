# Issue

**Title:** Feature/buildtool package publish

## Description

This PR adds package and publish tasks to the buildfile, replacing the standalone createMLTBX.m approach with proper buildtool integration.

Summary:

  - package task replaces the standalone createMLTBX.m script with a proper buildtool task. Instead of passing the version as a
  function argument, it reads from the CI_COMMIT_TAG environment variable. The release workflow sets a git tag (ex - v3.0.2) and the package task picks it up automatically. 
  - publish task leverages MATLAB's [publish](https://www.mathworks.com/help/matlab/ref/publish.html) to convert example .m files into self-contained HTML pages. MATLAB's [Rich text editing format](https://www.mathworks.com/help/matlab/matlab_prog/marking-up-matlab-comments-for-publishing.html) (%% Section, % * bullet, % <link text>) embedded directly in .m files produces beautifully formatted documentation without requiring Live Scripts (.mlx). This replaces the old approach of manually exporting each .mlx file and shuffling images around. Inputs/outputs are declared so the task is skipped entirely when sources haven't changed.
  - "index.m" solves the discoverability problem: with 27 example files generating HTML, navigation can be difficult. index.m is a single table-of-contents file organized by topic (Getting Started, Distributions, Faceting, Colors, Geom Layers, Stat Layers, Advanced). Running publish on it produces index.html, a landing page that links to every example, letting users browse it seamlessly without remembering file names.
  - Generated HTML should not be source-controlled. In the main branch HTML pages are pushed in source control, this leads to noisy diffs and stale artifacts. Instead, HTML is produced on demand via buildtool publish and deployed to GitHub Pages through CI. The gramm/examples/html/ directory is meant to be gitignored.

  Note: The example .m files included here are provided as a reference structure. They have not been modified with rich-text formatting yet. We encourage individually enhancing each example_*.m with MATLAB's markup syntax to produce polished, narrated HTML documentation when published. 
  
  Issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7aef54a945a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.