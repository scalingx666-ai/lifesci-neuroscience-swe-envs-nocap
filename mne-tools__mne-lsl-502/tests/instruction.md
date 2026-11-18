# Issue

**Title:** Bump autofix-ci/action from 1.3.2 to 1.3.3

## Description

Bumps [autofix-ci/action](https://github.com/autofix-ci/action) from 1.3.2 to 1.3.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/autofix-ci/action/releases">autofix-ci/action's releases</a>.</em></p>
<blockquote>
<h2>autofix-ci/action 1.3.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Move Autofix API from <code>.ci</code> to <code>.com</code> TLD.
This aims to improve overall reliability (<a href="">#32</a>). <code>api.autofix.ci</code> will remain available as an alias for the time being.</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/autofix-ci/action/compare/v1.3.2...v1.3.3">https://github.com/autofix-ci/action/compare/v1.3.2...v1.3.3</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7a166d7</code></a> move autofix api from <code>api.autofix.ci</code> to <code>autofix-api.maximilianhils.com</code></li>
<li>See full diff in <a href="https://github.com/autofix-ci/action/compare/v1.3.2...v1.3.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=autofix-ci/action&package-manager=github_actions&previous-version=1.3.2&new-version=1.3.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ec2d7e86fbc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.