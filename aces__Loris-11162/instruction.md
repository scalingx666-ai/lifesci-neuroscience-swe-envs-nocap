# Issue

**Title:** Bump squizlabs/php_codesniffer from 3.13.5 to 3.13.6

## Description

Bumps [squizlabs/php_codesniffer](https://github.com/PHPCSStandards/PHP_CodeSniffer) from 3.13.5 to 3.13.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/PHPCSStandards/PHP_CodeSniffer/releases">squizlabs/php_codesniffer's releases</a>.</em></p>
<blockquote>
<h2>3.13.6 - 2026-08-06</h2>
<p><strong>This is a security release and all users are advised to update their install(s) as soon as possible.</strong></p>
<h3>Changed</h3>
<ul>
<li>Various housekeeping, including improvements to the tests and documentation.
<ul>
<li>Thanks to <a href="https://github.com/morozov">Sergei Morozov</a> and <a href="https://github.com/jrfnl">Juliette Reinders Folmer</a> for their contributions.</li>
</ul>
</li>
</ul>
<h3>Fixed</h3>
<ul>
<li><strong>SECURITY FIX</strong>: Running PHP_CodeSniffer over untrusted files, for example, in a CI pipeline that scans pull requests, or on a developer machine reviewing third-party code, could result in attacker-controlled shell commands being executed when the <code>Gitblame</code>, <code>Hgblame</code> or <code>Svnblame</code> report(s) would process a file whose name contains shell metacharacters. <a href="">#1473</a>
<ul>
<li>Users using the default <code>Full</code> report, or any of the other non-*blame reports, are not affected.</li>
<li>For more details, see the <a href="https://github.com/PHPCSStandards/PHP_CodeSniffer/security/advisories/GHSA-hmqg-cxww-wqhq">security advisory</a>.</li>
<li>Thanks go to <a href="https://github.com/Faze-up">Faze-up</a> and <a href="https://github.com/edorian">Volker Dusch</a> for responsibly disclosing the vulnerability.</li>
<li>Additionally, thanks go to <a href="https://github.com/edorian">Volker Dusch</a>, <a href="https://github.com/rodrigoprimo">Rodrigo Primo</a>, <a href="https://github.com/fredden">Dan Wallis</a> and <a href="https://github.com/jrfnl">Juliette Reinders Folmer</a> for creating and testing the fix.</li>
</ul>
</li>
</ul>
<h3>Other</h3>
<ul>
<li>The GPG signature for the PHAR files has been rotated. The new fingerprint is: 5CB4F778BF9BC4FB67AE511D96E91A992CF22FF4.</li>
</ul>
<hr />
<h3>Statistics</h3>
<p><strong>Closed</strong>: 0 issues
<strong>Merged</strong>: 46 pull requests</p>
<p>Follow <a href="https://phpc.social/@phpcs"><code>@​phpcs on Mastodon</code></a> or <a href="https://twitter.com/PHP_CodeSniffer"><code>@​PHP_CodeSniffer on X</code></a> to stay informed.</p>
<p>Please consider <a href="https://opencollective.com/php_codesniffer">funding the PHP_CodeSniffer project</a>. If you already do so: thank you!</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/PHPCSStandards/PHP_CodeSniffer/blob/4.x/CHANGELOG-3.x.md">squizlabs/php_codesniffer's changelog</a>.</em></p>
<blockquote>
<h2>[3.13.6] - 2026-08-06</h2>
<p><strong>This is a security release and all users are advised to update their install(s) as soon as possible.</strong></p>
<h3>Changed</h3>
<ul>
<li>Various housekeeping, including improvements to the tests and documentation.
<ul>
<li>Thanks to [Sergei Morozov][<a href="https://github.com/morozov"><code>@​morozov</code></a>] and [Juliette Reinders Folmer][<a href="https://github.com/jrfnl"><code>@​jrfnl</code></a>] for their contributions.</li>
</ul>
</li>
</ul>
<h3>Fixed</h3>
<ul>
<li><strong>SECURITY FIX</strong>: Running PHP_CodeSniffer over untrusted files, for example, in a CI pipeline that scans pull requests, or on a developer machine reviewing third-party code, could result in attacker-controlled shell commands being executed when the <code>Gitblame</code>, <code>Hgblame</code> or <code>Svnblame</code> report(s) would process a file whose name contains shell metacharacters. <a href="">#1473</a>
<ul>
<li>Users using the default <code>Full</code> report, or any of the other non-*blame reports, are not affected.</li>
<li>For more details, see the <a href="https://github.com/PHPCSStandards/PHP_CodeSniffer/security/advisories/GHSA-hmqg-cxww-wqhq">security advisory</a>.</li>
<li>Thanks go to [Faze-up][<a href="https://github.com/Faze-up"><code>@​Faze-up</code></a>] and [Volker Dusch][<a href="https://github.com/edorian"><code>@​edorian</code></a>] for responsibly disclosing the vulnerability.</li>
<li>Additionally, thanks go to [Volker Dusch][<a href="https://github.com/edorian"><code>@​edorian</code></a>], [Rodrigo Primo][<a href="https://github.com/rodrigoprimo"><code>@​rodrigoprimo</code></a>], [Dan Wallis][<a href="https://github.com/fredden"><code>@​fredden</code></a>] and [Juliette Reinders Folmer][<a href="https://github.com/jrfnl"><code>@​jrfnl</code></a>] for creating and testing the fix.</li>
</ul>
</li>
</ul>
<h3>Other</h3>
<ul>
<li>The GPG signature for the PHAR files has been rotated. The new fingerprint is: 5CB4F778BF9BC4FB67AE511D96E91A992CF22FF4.</li>
</ul>
<p><a href="">#1473</a>: <a href="">PHPCSStandards/PHP_CodeSniffer#1473</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4c378e1</code></a> Merge pull request <a href="">#1474</a> from PHPCSStandards/feature/changelog-3.13.6</li>
<li><a href=""><code>ddbf849</code></a> Merge pull request <a href="">#1473</a> from PHPCSStandards/security/cve-2026-67434</li>
<li><a href=""><code>742a068</code></a> Changelog for the 3.13.6 release</li>
<li><a href=""><code>7a3a6bb</code></a> Reports/*blame: properly escape file name</li>
<li><a href=""><code>b5ce04f</code></a> Merge pull request <a href="">#1470</a> from PHPCSStandards/dependabot/github_actions/3.x/ac...</li>
<li><a href=""><code>5f72703</code></a> GH Actions: Bump the action-runners group with 2 updates</li>
<li><a href=""><code>20d0f55</code></a> Merge pull request <a href="">#1466</a> from PHPCSStandards/dependabot/github_actions/3.x/ac...</li>
<li><a href=""><code>2a2ac29</code></a> Merge pull request <a href="">#1469</a> from PHPCSStandards/feature/ghactions-setup-php-fail...</li>
<li><a href=""><code>6df695f</code></a> Merge pull request <a href="">#1467</a> from PHPCSStandards/dependabot/github_actions/3.x/ac...</li>
<li><a href=""><code>4da0184</code></a> GH Actions: fail &quot;setup-php&quot; if requested tooling could not be installed</li>
<li>Additional commits viewable in <a href="https://github.com/PHPCSStandards/PHP_CodeSniffer/compare/3.13.5...3.13.6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=squizlabs/php_codesniffer&package-manager=composer&previous-version=3.13.5&new-version=3.13.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/aces/Loris/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eb19ac51165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.