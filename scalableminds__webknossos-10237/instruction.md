# Issue

**Title:** Replace documentation.js with TSDoc for the frontend API docs

## Description

### Summary
The frontend scripting API docs are now built in webknossos-libs with mkdocstrings-typescript (TypeDoc) and published under https://docs.webknossos.org/frontend-api/index.html (companion PR in webknossos-libs: ). This PR prepares the WK side:

- Replace the documentation.js tags in `api_loader.ts` / `api_latest.ts` with TSDoc:
  - `@name`, `@memberof`, `@instance`, `@version`, `@class` removed (inferred by TypeDoc)
  - `@private` / `@ignore` → `@internal`
  - `@param {type} name` / `@returns {type}` → `@param name` / `@returns` (types come from the signatures)
- `getVisibleSegmentationLayerName`, `getVolumeTracingLayerIds`, `getDataForBoundingBox` and `getDataFor2DBoundingBox` used `/*` instead of `/**` and were therefore missing from the docs. They are documented now; `getDataFor2DBoundingBox` is marked `@deprecated`. The experimental `_`-prefixed methods stay undocumented.
- Add a class comment to `ApiLoader`, fix a stale `showToast` example.
- Remove the `documentation` dependency and the `docs` script.
- Point the navbar, script list, README and docs links to the new docs location.

### Steps to test:
- In webknossos-libs (companion PR), symlink this checkout as `docs/wk-repo` and run `docs/generate.sh`. Check the "Reference → Frontend Scripting API" pages.
- Navbar help menu → "Frontend API Documentation" and the hint on the scripts list page open the new docs.

### Issues:
- Companion PR:

------
- [x] Added changelog entry
- [x] Updated [documentation](../blob/master/docs) if applicable

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d86a4e558296`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.