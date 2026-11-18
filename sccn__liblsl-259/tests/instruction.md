# Issue

**Title:** Fix logic check for UDP error, handle socket close

## Description

This fix prevents `request_next_packet()` being called when there is an `asio::error::operation_aborted` or `asio::error::shut_down`.

previously, this would always return true even if the error was one of the above because of the or/`||` 

There are also additional checks in the TCP/UDP server and stream outlet to (hopefully) more gracefully handle socket closure.

may address 
I have experienced a segfault when switching networks on Windows and MacOS (I am primarily using Linux now but I haven't tried disconnecting an interface to see if it reproduces)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdf917d0936d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.