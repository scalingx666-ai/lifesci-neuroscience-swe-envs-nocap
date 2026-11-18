# Issue

**Title:** Allow boto3 client parameters region_name and endpoint_url

## Description

I needed this for local testing using a dockerized sqs queue, where the endpoint_url to boto3.client is required and credentials are not necessary.
https://hub.docker.com/r/roribio16/alpine-sqs/

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0111360e78ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.