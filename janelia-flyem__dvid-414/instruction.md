# Issue

**Title:** Bump golang.org/x/oauth2 from 0.7.0 to 0.27.0

## Description

Bumps [golang.org/x/oauth2](https://github.com/golang/oauth2) from 0.7.0 to 0.27.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>681b4d8</code></a> jws: split token into fixed number of parts</li>
<li><a href=""><code>3f78298</code></a> all: upgrade go directive to at least 1.23.0 [generated]</li>
<li><a href=""><code>109dabf</code></a> endpoints: add links/provider for Discord</li>
<li><a href=""><code>ac571fa</code></a> oauth2: fix docs for Config.DeviceAuth</li>
<li><a href=""><code>314ee5b</code></a> endpoints: add patreon endpoint</li>
<li><a href=""><code>b9c813b</code></a> google: add warning about externally-provided credentials</li>
<li><a href=""><code>49a531d</code></a> all: make method and struct comments match the names</li>
<li><a href=""><code>22134a4</code></a> README: don't recommend go get</li>
<li><a href=""><code>3e64809</code></a> x/oauth2: add Token.ExpiresIn</li>
<li><a href=""><code>16a9973</code></a> jwt: rename example to avoid vet error</li>
<li>Additional commits viewable in <a href="https://github.com/golang/oauth2/compare/v0.7.0...v0.27.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/oauth2&package-manager=go_modules&previous-version=0.7.0&new-version=0.27.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9695ca54906c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.