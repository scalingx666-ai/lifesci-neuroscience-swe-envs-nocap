# Issue

**Title:** STYLE: Use `toStdString().c_str()` instead of `toLatin1()` for `char*`

## Description

Use `toStdString().c_str()` instead of `toLatin1()` to get a `const char*`.

Documentation:
https://doc.qt.io/qt-5/qstring.html#toStdString
https://doc.qt.io/qt-5/qstring.html#toLatin1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0bbe2cf9ddf7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.