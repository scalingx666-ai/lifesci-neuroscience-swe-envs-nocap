# Issue

**Title:** use pipeline for neuronjson /all writes to decrease latency

## Description

Immediately writes neuron data to pipeline of JSON encoding -> optional Gzip compression -> HTTP response. Likely will reduce latency, particularly for gzip-enabled requests. @stuarteberg

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48dfb9773036`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.