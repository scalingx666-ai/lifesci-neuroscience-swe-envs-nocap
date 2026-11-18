# Issue

**Title:** Allow wrapup function to deal with atlas links with incomplete TLS certificates

## Description

## Description

Adds a way to catch SSL certificate errors during atlas wrapup. This deals with the issue where some atlas links have incomplete certificates, which stop the wrapup function unexpectedly. This solution was suggested by @IgorTatarnikov. 

**What is this PR**

- [X] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Without this change in the code, certain atlas links such as https://lambada.icm-institute.org/ would crash the wrapup function due to raising an unexpected `requests.exceptions.SSLError`. 

## References
 

## How has this PR been tested?
`requests.head()` was tested locally with the LAMBADA atlas link to see if it successfully obtains the headers from the website (which it does)
However, this does cause an Insecure Request Warning, as follows: 
```
InsecureRequestWarning: Unverified HTTPS request is being made to host 'lambada.icm-institute.org'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
```

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No.

## Checklist:

- [X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `937aa232de79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.