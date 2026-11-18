# Issue

**Title:** Add OAuth2 log-in support

## Description

This makes it possible to use external services like Orcid.org or GitHub to sign-in to CATMAID instances. If enabled, a menu is shown with all enabled login methods when hovering the mouse over the Login button in the upper right corner. Nothing of the regular login-logic changes, this adds only optional additional functionality.

This uses [django-allauth](https://django-allauth.readthedocs.io/) for the actual OAuth2 logic, which is actively developed and under MIT license. Their documentation has a complete list of supported services (many). By default only the basic infrastructure is loaded, which doesn't add any overhead.  None of the extra log-in options are enabled by default. Our documentation has now some information on how to allow sign-in via GitHub and Orcid.org.

This feature is needed for a publicly accessible CATMAID instance, where users will be able to log-in and create their own working spaces.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc1e08f0c68f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.