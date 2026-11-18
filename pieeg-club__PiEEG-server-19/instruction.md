# Issue

**Title:** OSC VRChat

## Description

Adds a VRChat OSC bridge feature that streams live EEG band powers to VRChat (chatbox + avatar parameters) and exposes start/stop/config controls via the dashboard and WebSocket server.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e79594581494`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.