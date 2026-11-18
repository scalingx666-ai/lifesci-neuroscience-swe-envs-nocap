# Issue

**Title:** chore(deps): bump sshpk from 1.13.1 to 1.16.1

## Description

Bumps [sshpk](https://github.com/joyent/node-sshpk) from 1.13.1 to 1.16.1.
<details>
<summary>Release notes</summary>

*Sourced from [sshpk's releases](https://github.com/joyent/node-sshpk/releases).*

> ## v1.16.1
> * Fixes for  (correctly encoding certificates with expiry dates >=2050),  (accepting PKCS#8 EC private keys with missing public key parts)
>
> ## v1.16.0
>  * Add support for SPKI fingerprints, PuTTY PPK format (public-key only for now), PKCS#8 PBKDF2 encrypted private keys
>  * Fix for
>
> ## v1.15.2
>  * New API for accessing x509 extensions in certificates
>  * Fixes for ,
>
> ## v1.14.1
>  * Remove all remaining usage of jodid25519 (abandoned dep)
>  * Add support for DNSSEC key format
>  * Add support for Ed25519 keys in PEM format (according to draft-curdle-pkix)
>  * Fixes for X.509 encoding issues (asn.1 NULLs in RSA certs, cert string type mangling)
>  * Performance issues parsing long SSH public keys
</details>
<details>
<summary>Commits</summary>

-  [joyent/node-sshpk#60](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/60) certs should generate GeneralizedTime values for dates >...
-  [joyent/node-sshpk#62](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/62) handle pkcs8 ECDSA keys with missing public parts
-  [joyent/node-sshpk#18](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/18) support for PKCS8 encrypted private keys
-  [joyent/node-sshpk#27](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/27) Add support for PuTTY PPK format
-  [joyent/node-sshpk#59](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/59) want support for SPKI fingerprint format
-  [joyent/node-sshpk#48](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/48) wish: add support for x509 certificates in text form
-  [joyent/node-sshpk#58](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/58) des-ede3-cbc encrypted keys broken
-  [joyent/node-sshpk#56](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/56) md5 fingerprints not quite right
-  [joyent/node-sshpk#53](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/53) stop using optional deps to fix webpack
-  [joyent/node-sshpk#50](https://github-redirect.dependabot.com/joyent/node-sshpk/issues/50) Support PKCS#5 AES-256-CBC encrypted private keys
- Additional commits viewable in [compare view](https://github.com/joyent/node-sshpk/compare/v1.13.1...v1.16.1)
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=sshpk&package-manager=npm_and_yarn&previous-version=1.13.1&new-version=1.16.1)](https://help.github.com/articles/configuring-automated-security-fixes)

Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

<details>
<summary>Dependabot commands and options</summary>
<br />

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot ignore this [patch|minor|major] version` will close this PR and stop Dependabot creating any more for this minor/major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/urish/muse-js/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72cbd4d388dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.