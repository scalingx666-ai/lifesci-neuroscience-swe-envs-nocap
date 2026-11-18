# Issue

**Title:** Bump pynacl from 1.5.0 to 1.6.2

## Description

Bumps [pynacl](https://github.com/pyca/pynacl) from 1.5.0 to 1.6.2.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pyca/pynacl/blob/main/CHANGELOG.rst">pynacl's changelog</a>.</em></p>
<blockquote>
<h2>1.6.2 (2026-01-01)</h2>
<ul>
<li>Updated <code>libsodium</code> to 1.0.20-stable (2025-12-31 build) to resolve
<code>CVE-2025-69277</code>.</li>
</ul>
<h2>1.6.1 (2025-11-10)</h2>
<ul>
<li>The <code>MAKE</code> environment variable can now be used to specify the <code>make</code>
binary that should be used in the build process.</li>
</ul>
<h2>1.6.0 (2025-09-11)</h2>
<ul>
<li><strong>BACKWARDS INCOMPATIBLE:</strong> Removed support for Python 3.6 and 3.7.</li>
<li>Added support for the low level AEAD AES bindings.</li>
<li>Added support for <code>crypto_core_ed25519_from_uniform</code>.</li>
<li>Update <code>libsodium</code> to 1.0.20-stable (2025-08-27 build).</li>
<li>Added support for free-threaded Python 3.14.</li>
<li>Added support for Windows on ARM wheels.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ecf41f5</code></a> changelog and version bump for 1.6.2 (<a href="">#923</a>)</li>
<li><a href=""><code>685a5e7</code></a> Switch to PyPI trusted publishing (<a href="">#925</a>)</li>
<li><a href=""><code>78e0aa3</code></a> missed adding these files as part of the libsodium update (<a href="">#924</a>)</li>
<li><a href=""><code>9631488</code></a> Bump libsodium to the latest 1.0.20 (<a href="">#922</a>)</li>
<li><a href=""><code>563b25b</code></a> Add script to update vendored libsodium (<a href="">#921</a>)</li>
<li><a href=""><code>d233105</code></a> Include libsodium license in wheels (<a href="">#917</a>)</li>
<li><a href=""><code>cabc3a8</code></a> Bump dessant/lock-threads from 5 to 6 (<a href="">#914</a>)</li>
<li><a href=""><code>f359617</code></a> Bump actions/download-artifact from 6.0.0 to 7.0.0 (<a href="">#915</a>)</li>
<li><a href=""><code>fb6e37f</code></a> Bump actions/upload-artifact from 5 to 6 (<a href="">#916</a>)</li>
<li><a href=""><code>526f992</code></a> Bump actions/checkout from 6.0.0 to 6.0.1 (<a href="">#911</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pyca/pynacl/compare/1.5.0...1.6.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pynacl&package-manager=uv&previous-version=1.5.0&new-version=1.6.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-website/network/alerts).

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--784.org.readthedocs.build/en/784/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcb4702a9e50`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.