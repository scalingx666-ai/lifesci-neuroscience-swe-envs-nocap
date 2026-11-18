# Issue

**Title:** CI: build Android on PRs, with the NDK toolchain at API 21

## Description

.

`android.yml` only ran on pushes to an `androidci` branch (or by hand) and only built for API 30. Android breakage was therefore found by users, and #169 (`pthread_getname_np` only exists from API 26) could not have been caught at all.

- Runs on pull requests and `main`/`dev` pushes, with the same duplicate-run skip as the other workflows.
- Builds arm64-v8a, armeabi-v7a, x86_64 and x86 with the NDK's toolchain file at `ANDROID_PLATFORM=android-21`: what Android Studio's Gradle build passes to CMake for an app with `minSdk 21`. Plus a static arm64 build, and one build with CMake's built-in Android support (API 30) so that path stays covered.
- Also builds `testing/consumer` with FetchContent, the way an app's `CMakeLists.txt` pulls in liblsl.
- Unit tests are compiled but not run (no emulator).

No local NDK was available, so this PR's own CI run is the first test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79fa78515b4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.