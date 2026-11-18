# Issue

**Title:** Bump actions/download-artifact from 7.0.0 to 8.0.1

## Description

Bumps [actions/download-artifact](https://github.com/actions/download-artifact) from 7.0.0 to 8.0.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
<h2>v8.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Support for CJK characters in the artifact name by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#471</a></li>
<li>Add a regression test for artifact name + content-type mismatches by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#472</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v8...v8.0.1">https://github.com/actions/download-artifact/compare/v8...v8.0.1</a></p>
<h2>v8.0.0</h2>
<h2>v8 - What's new</h2>
<blockquote>
<p>[!IMPORTANT]
actions/download-artifact@v8 has been migrated to an ESM module. This should be transparent to the caller but forks might need to make significant changes.</p>
</blockquote>
<blockquote>
<p>[!IMPORTANT]
Hash mismatches will now error by default. Users can override this behavior with a setting change (see below).</p>
</blockquote>
<h3>Direct downloads</h3>
<p>To support direct uploads in <code>actions/upload-artifact</code>, the action will no longer attempt to unzip all downloaded files. Instead, the action checks the <code>Content-Type</code> header ahead of unzipping and skips non-zipped files. Callers wishing to download a zipped file as-is can also set the new <code>skip-decompress</code> parameter to <code>true</code>.</p>
<h3>Enforced checks (breaking)</h3>
<p>A previous release introduced digest checks on the download. If a download hash didn't match the expected hash from the server, the action would log a warning. Callers can now configure the behavior on mismatch with the <code>digest-mismatch</code> parameter. To be secure by default, we are now defaulting the behavior to <code>error</code> which will fail the workflow run.</p>
<h3>ESM</h3>
<p>To support new versions of the @actions/* packages, we've upgraded the package to ESM.</p>
<h2>What's Changed</h2>
<ul>
<li>Don't attempt to un-zip non-zipped downloads by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#460</a></li>
<li>Add a setting to specify what to do on hash mismatch and default it to <code>error</code> by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#461</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v7...v8.0.0">https://github.com/actions/download-artifact/compare/v7...v8.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3e5f45b</code></a> Add regression tests for CJK characters (<a href="">#471</a>)</li>
<li><a href=""><code>e6d03f6</code></a> Add a regression test for artifact name + content-type mismatches (<a href="">#472</a>)</li>
<li><a href=""><code>70fc10c</code></a> Merge pull request <a href="">#461</a> from actions/danwkennedy/digest-mismatch-behavior</li>
<li><a href=""><code>f258da9</code></a> Add change docs</li>
<li><a href=""><code>ccc058e</code></a> Fix linting issues</li>
<li><a href=""><code>bd7976b</code></a> Add a setting to specify what to do on hash mismatch and default it to <code>error</code></li>
<li><a href=""><code>ac21fcf</code></a> Merge pull request <a href="">#460</a> from actions/danwkennedy/download-no-unzip</li>
<li><a href=""><code>15999bf</code></a> Add note about package bumps</li>
<li><a href=""><code>974686e</code></a> Bump the version to <code>v8</code> and add release notes</li>
<li><a href=""><code>fbe48b1</code></a> Update test names to make it clearer what they do</li>
<li>Additional commits viewable in <a href="https://github.com/actions/download-artifact/compare/37930b1c2abaa49bbe596cd826c3c89aef350131...3e5f45b2cfb9172054b4087a40e8e0b5a5461e7c">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/download-artifact&package-manager=github_actions&previous-version=7.0.0&new-version=8.0.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d0dc751808d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.