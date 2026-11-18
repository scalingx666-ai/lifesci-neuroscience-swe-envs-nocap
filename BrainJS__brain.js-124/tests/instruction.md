# Issue

**Title:** Use Browserify standalone option for browser build

## Description

Browserify has a `standalone` flag which wraps the default export into a [universal module definition](https://github.com/umdjs/umd) or a global variable in the browser build. That way it works with all module loaders and the index file does not have to check for a window.

This also makes it possible to use Brain.js with Webpack out of the box (which I would like to support in my [Brain.js natural language classifier](https://github.com/mysamai/natural-brain)).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69ff0bec59dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.