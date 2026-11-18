# Issue

**Title:** build(deps): bump cryptography from 46.0.3 to 46.0.6

## Description

Bumps [cryptography](https://github.com/pyca/cryptography) from 46.0.3 to 46.0.6.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst">cryptography's changelog</a>.</em></p>
<blockquote>
<p>46.0.6 - 2026-03-25</p>
<pre><code>
* **SECURITY ISSUE**: Fixed a bug where name constraints were not applied
  to peer names during verification when the leaf certificate contains a
  wildcard DNS SAN. Ordinary X.509 topologies are not affected by this bug,
  including those used by the Web PKI. Credit to **Oleh Konko (1seal)** for
  reporting the issue. **CVE-2026-34073**
<p>.. _v46-0-5:</p>
<p>46.0.5 - 2026-02-10<br />
</code></pre></p>
<ul>
<li>An attacker could create a malicious public key that reveals portions of your
private key when using certain uncommon elliptic curves (binary curves).
This version now includes additional security checks to prevent this attack.
This issue only affects binary elliptic curves, which are rarely used in
real-world applications. Credit to <strong>XlabAI Team of Tencent Xuanwu Lab and
Atuin Automated Vulnerability Discovery Engine</strong> for reporting the issue.
<strong>CVE-2026-26007</strong></li>
<li>Support for <code>SECT*</code> binary elliptic curves is deprecated and will be
removed in the next release.</li>
</ul>
<p>.. v46-0-4:</p>
<p>46.0.4 - 2026-01-27</p>
<pre><code>
* `Dropped support for win_arm64 wheels`_.
* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.5.5.
<p>.. _v46-0-3:<br />
</code></pre></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>91d7288</code></a> Cherry-pick <a href="">#14542</a> (<a href="">#14543</a>)</li>
<li><a href=""><code>06e120e</code></a> bump version for 46.0.5 release (<a href="">#14289</a>)</li>
<li><a href=""><code>0eebb9d</code></a> EC check key on cofactor &gt; 1 (<a href="">#14287</a>)</li>
<li><a href=""><code>bedf6e1</code></a> fix openssl version on 46 branch (<a href="">#14220</a>)</li>
<li><a href=""><code>e6f44fc</code></a> bump for 46.0.4 and drop win arm64 due to CI issues (<a href="">#14217</a>)</li>
<li>See full diff in <a href="https://github.com/pyca/cryptography/compare/46.0.3...46.0.6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=cryptography&package-manager=uv&previous-version=46.0.3&new-version=46.0.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/brainiak/brainiak/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad3c27c5fc4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.