# Issue

**Title:** Migrate from deprecated WebVR to WebXR

## Description

WebVR has been deprecated for some time and as such the 3D viewer VR feature no longer works in Firefox or Chrome. This migrates to the successor WebXR API to restore functionality in Firefox (with the `dom.vr.webxr.enabled` flag set and only when served over HTTPS).

Fixing Chrome would require upgrading Three to r125 or later. Three's WebXR support has evolved considerably since r122 so would likely require some small changes in addition to this PR if it is upgraded.

This feature can be tested without a VR headset using [this extension from Mozilla Reality](https://addons.mozilla.org/en-US/firefox/addon/webxr-api-emulator/).

A few driveby commits resulting from getting minimal `tsc` checking running on the 3D viewer are included.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b19221079e6d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.