# Issue

**Title:** Logging using loguru

## Description

This PR adds logging using[ loguru](https://github.com/Delgan/loguru) library. All `print` calls have been replaced to `logger.info/warning/error`.

What it looks like in the console:
![2019-06-11_04-25-42](https://user-images.githubusercontent.com/1299189/59237095-9722b180-8c01-11e9-8ed3-16c042e4a247.png)

Also this PR moves `main()` function (entry point) to `__main__` module. If you want to run the program from PyCharm run/debug configuration, you should use something like this:

![2019-06-11_04-38-16](https://user-images.githubusercontent.com/1299189/59237394-d1408300-8c02-11e9-89be-6fc74125d078.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf3d87313a59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.