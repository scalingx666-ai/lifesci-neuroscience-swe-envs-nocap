# Issue

**Title:** Fail the build if the code splitting regresses

## Description

### Summary

Adds a Vite build plugin, `frontend/vite/vite-plugin-assert-code-splitting.ts`, that fails `yarn build` (and so CI) when the code splitting regresses. It checks the **initial payload**: the entry chunk, every chunk it statically imports (i.e. every `modulepreload`), and their CSS.

1. **The lazy boundary exists:** `viewer/viewer_entry.ts` is not in the initial payload and is still emitted as a dynamic chunk.
2. **No viewer markers upfront:** three.js, protobufjs, flexlayout-react, the Model, root saga, root reducer, `tracing_layout_view`, controllers, geometries/shaders. A failure prints the shortest static import chain from `main.tsx`, which ends at the edge to cut. Findings caused by a leaked lazy entry are not repeated.
3. **Budget:** gzipped initial payload ≤ 1,100 kB (currently 1,057 kB). Every build logs the current number.

Example failure after re-adding a `skeletontracing_accessor` import to the dashboard:
```
three.js (1 module) is part of the initial payload, imported via:
    frontend/javascripts/main.tsx
      -> frontend/javascripts/router/router.tsx
      -> frontend/javascripts/dashboard/dashboard_view.tsx
      -> frontend/javascripts/viewer/model/accessors/skeletontracing_accessor.ts
      -> frontend/javascripts/viewer/model/accessors/dataset_layer_transformation_accessor.ts
      -> node_modules/three/build/three.module.js

The initial payload: 1,160 kB gzip (1,145 kB JS in 9 chunks + 15 kB CSS), budget 1,100 kB.
```

### Steps to test:
- `yarn build` passes and logs `[plugin assert-code-splitting] initial payload: …`.
- Add `import { getSkeletonTracing } from "viewer/model/accessors/skeletontracing_accessor";` (and use it) in `dashboard_view.tsx`: the build fails with the chain above.
- Replace the `import("viewer/viewer_entry")` in `route_wrappers.tsx` with a static import: the build fails, naming `viewer_entry.ts`.

### Issues:
- none

------
(Please delete unneeded items, merge only when none are left open)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b8e6f45b2e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.