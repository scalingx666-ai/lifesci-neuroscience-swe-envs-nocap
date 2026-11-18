# Issue

**Title:** Fix the locked-note switch crash and show the note loading skeleton from the click

## Description

## The crash

Opening a locked (or view-only) note and then clicking another one took the whole app to a blank window, every time. Reproduced on a build byte-identical to production v0.1.59, against the real server, and captured:

```
Error: Calls to EditorView.update are not allowed while an update is in progress
  update / dispatch            (@codemirror/view)
  Editor.tsx:721               ← editable.reconfigure, the [readOnly] effect
  commitHookEffectListMount
  flushPassiveEffects
  flushSyncWorkAcrossRoots_impl
  flushSync
  toDOM @ reactWidget.ts       ← inside a CM6 update
  updateInner                  (@codemirror/view)
```

Read bottom-up: CodeMirror is mid-update building a widget's DOM; `ReactWidget.toDOM` calls `flushSync`; React answers by flushing **the whole app root's** pending passive effects, not just the widget's own tree; `Editor`'s `[readOnly]` effect runs and dispatches back into the view CodeMirror is still updating.

Only locked notes got there. Opening the first locked note populates the `locks` store (`read-only` status → `refreshLocks`), so every locked note after it is built read-only from frame one; the teardown's transient vault-channel `"synced"` then flips `readOnly` false→true. Two reconfigures, each rebuilding the note-header widgets whose decorations key off `state.readOnly`.

`<Editor>` had no `ErrorBoundary`, so one throw unmounted the entire React tree — and release builds carry no logging (`tauri_plugin_log` is `#[cfg(debug_assertions)]`), which is why this was undiagnosable in the field.

## What changed

- `lib/editor/effectDispatch.ts` (new) — `dispatchAfterCommit` defers to a microtask, guaranteed to run after the update unwinds and still before paint. `isLive` is read at dispatch time, so a note switch can't push the old note's transaction into the new note's view.
- `Editor.tsx` — all three compartment reconfigures (`readOnly`, `propertiesMode`, `lineNumbers`) go through it. These were the only commit-phase dispatches in the app; `InlineTitle` and `TableWidget` dispatch from `useCallback` handlers, which are safe.
- `Editor.tsx` — the `[syncStatus]` effect is gated on `bridgeRef.current`. The teardown's phantom `"synced"` was setting `hadEditAccessRef` on a note that never had edit access, permanently disabling the pre-verdict keystroke rollback for the session (a silent CRDT/disk fork). That was also the trigger for the reconfigure storm above.
- `App.tsx` — `<ErrorBoundary label="Editor" resetKeys={[openNote.path]}>`.

## Loading skeleton

Separate report, same area: the loader showed locally but not in production.

The editor column branched on `openNote`, which `openNoteByPath` sets only after `getNoteMeta` + `registerNote`. `openingNotePath` — set on the click — was read by `FileTree` and `TabBar` but never by the editor, and on a first open no `<Editor>` is mounted at all, so the column showed "Select a note" for the whole wait. Both now render the skeleton.

The 180ms hold drops to 90ms. That number was tuned against a dev build, where StrictMode double-invokes the open effect and the pane sits empty roughly twice as long as in a release build; an open landing between the two painted a bare pane and then text. A fast local open (~40ms) still shows nothing. `[data-immediate]` now zeroes the delay rather than killing the animation, so the bars no longer snap to full opacity mid-fade.

## Testing

- New `effectDispatch.test.ts`: the first case reproduces the original throw, so it can't regress silently; the rest pin the deferral, the liveness drop and cleanup cancellation.
- Full desktop suite: 1375 passed, typecheck clean.
- The crash fix was reproduced and diagnosed on the real vault; **the post-fix click-through has not been verified live yet** — that is what this staging build is for.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3de408fb2bd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.