# Issue

**Title:** Bump setuptools from 82.0.0 to 82.0.1

## Description

Bumps [setuptools](https://github.com/pypa/setuptools) from 82.0.0 to 82.0.1.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/setuptools/blob/main/NEWS.rst">setuptools's changelog</a>.</em></p>
<blockquote>
<h1>v82.0.1</h1>
<h2>Bugfixes</h2>
<ul>
<li>Fix the loading of <code>launcher manifest.xml</code> file. (<a href="">#5047</a>)</li>
<li>Replaced deprecated <code>json.__version__</code> with fixture in tests. (<a href="">#5186</a>)</li>
</ul>
<h2>Improved Documentation</h2>
<ul>
<li>Add advice about how to improve predictability when installing sdists. (<a href="">#5168</a>)</li>
</ul>
<h2>Misc</h2>
<ul>
<li><a href="">#4941</a>, <a href="">#5157</a>, <a href="">#5169</a>, <a href="">#5175</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5a13876</code></a> Bump version: 82.0.0 → 82.0.1</li>
<li><a href=""><code>51ab8f1</code></a> Avoid using (deprecated) 'json.<strong>version</strong>' in tests (<a href="">#5194</a>)</li>
<li><a href=""><code>f9c37b2</code></a> Docs/CI: Fix intersphinx references (<a href="">#5195</a>)</li>
<li><a href=""><code>8173db2</code></a> Docs: Fix intersphinx references</li>
<li><a href=""><code>09bafbc</code></a> Fix past tense on newsfragment</li>
<li><a href=""><code>461ea56</code></a> Add news fragment</li>
<li><a href=""><code>c4ffe53</code></a> Avoid using (deprecated) 'json.<strong>version</strong>' in tests</li>
<li><a href=""><code>749258b</code></a> Cleanup <code>pkg_resources</code> dependencies and configuration (<a href="">#5175</a>)</li>
<li><a href=""><code>2019c16</code></a> Parse <code>ext-module.define-macros</code> from <code>pyproject.toml</code> as list of tuples (<a href="">#5169</a>)</li>
<li><a href=""><code>b809c86</code></a> Sync setuptools schema with validate-pyproject (<a href="">#5157</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/setuptools/compare/v82.0.0...v82.0.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=setuptools&package-manager=uv&previous-version=82.0.0&new-version=82.0.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7609b108ced`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.