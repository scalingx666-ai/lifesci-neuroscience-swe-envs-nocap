# Issue

**Title:** DVID Graph Backend

## Description

Creates an interface for manipulating a graph.  Implements the graph interface using the default ordered key/value DB.  (The current implementation should allow one to easily define their own backend graph storage.)  Defines a graph datatype that enables REST API interaction with the graph.  More features are needed such as maintaining a transaction history to support undos and bulk load of graph data.  Using an SSD, I can write 100K random edges in ~20 seconds (~15K writes and ~10K reads a second).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f99e5ab6bc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.