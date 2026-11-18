# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request introduces a new animated hero logo component for the Today dashboard, replacing the previous tesseract visual. It also updates the OAuth registration checklist documentation for improved clarity and workflow, and makes minor animation tweaks for smoother UI transitions. The most important changes are summarized below:

---

**UI Component Overhaul: Hero Logo**

* Added a new `createHeroLogo` component in `src/components/hero-logo.ts`, featuring an animated orbital status ring, breathing glow, pointer-driven parallax, and reactive segment states for system components. This replaces the hero tesseract on the Today dashboard.
* Updated `src/views/today/molecules.ts` to use `createHeroLogo` instead of `createHeroTesseract`, including cleanup of old references and hydration logic. [[1]](diffhunk://#diff-3f5fb15b8f69593098093f22fd7523fea6292772570b24c7e2484ffcb96f18bbL39-R42) [[2]](diffhunk://#diff-3f5fb15b8f69593098093f22fd7523fea6292772570b24c7e2484ffcb96f18bbL907-R911)

**Documentation Improvements: OAuth Registration**

* Revised `docs/oauth-registration-checklist.md` to clarify registration instructions, update service counts, add platform-specific notes, and provide a progress summary and priority order. The workflow for wiring client IDs after registration is also improved. [[1]](diffhunk://#diff-cabc592f547d5b30f491970da1ac6e78208735b4d802de199a4e4be4f01951cdL3-R55) [[2]](diffhunk://#diff-cabc592f547d5b30f491970da1ac6e78208735b4d802de199a4e4be4f01951cdL340-R411)

**Animation Tweaks**

* Removed the scale transformation from `viewEnter` and `viewLeave` in `src/components/animations.ts` for a more subtle and smooth transition effect. [[1]](diffhunk://#diff-5da0d96155c5c97191f10330e3a112c04e924442709f627a19a18b060ea85d0bL17) [[2]](diffhunk://#diff-5da0d96155c5c97191f10330e3a112c04e924442709f627a19a18b060ea85d0bL30)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73ac94c371c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.