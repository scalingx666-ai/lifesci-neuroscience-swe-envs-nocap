# Issue

**Title:** Bump neuroinformatics-unit/actions from 2 to 3

## Description

Bumps [neuroinformatics-unit/actions](https://github.com/neuroinformatics-unit/actions) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/neuroinformatics-unit/actions/releases">neuroinformatics-unit/actions's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<h2>What's Changed</h2>
<h3>Breaking change</h3>
<ul>
<li>Remove <code>upload_pypi</code> action by <a href="https://github.com/niksirbi"><code>@​niksirbi</code></a> in <a href="">neuroinformatics-unit/actions#181</a></li>
</ul>
<p>We have removed the <code>upload_pypi</code> action. Any packages using the <code>upload_pypi</code> action from the <code>main</code> branch of <code>neuroinformatics-unit/actions</code> will fail to upload to PyPI upon their next release. Using the actions from a tagged <code>v2</code> version should  not be affected.</p>
<p>That said, we strongly recommend that all packages migrate to the <a href="https://docs.pypi.org/trusted-publishers/">trusted publishing</a> route. See <a href="https://github.com/neuroinformatics-unit/actions/blob/34bedfdfd70c6010be02182c9ca37fae8a1fd99d/example_test_and_deploy.yml#L52-L66">this updated workflow</a> for an example. If you are building (or have built) packages using our <a href="https://github.com/neuroinformatics-unit/python-cookiecutter">python-cookiecutter</a>, read the <a href="https://python-cookiecutter.neuroinformatics.dev/infrastructure.html#trusted-publishing-on-pypi">updated docs</a> on this topic.</p>
<h3>New features</h3>
<ul>
<li>Add experimental test-uv reusable action by <a href="https://github.com/AlgoFoe"><code>@​AlgoFoe</code></a> in <a href="">neuroinformatics-unit/actions#164</a></li>
<li>fix: activate uv venv for setup-uv  by <a href="https://github.com/AlgoFoe"><code>@​AlgoFoe</code></a> in <a href="">neuroinformatics-unit/actions#165</a></li>
<li>Update headless setup and install input by <a href="https://github.com/AlgoFoe"><code>@​AlgoFoe</code></a> in <a href="">neuroinformatics-unit/actions#180</a></li>
</ul>
<h3>Dependencies</h3>
<ul>
<li>Bump pypa/gh-action-pypi-publish from 1.13.0 to 1.14.0 in /upload_pypi by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#161</a></li>
<li>Bump pypa/cibuildwheel from 3.4.0 to 3.4.1 in /build_wheels by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#160</a></li>
<li>Bump actions/checkout from 6 to 7 in /check_manifest in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#166</a></li>
<li>Bump actions/checkout from 6 to 7 in /deploy_sphinx_docs in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#167</a></li>
<li>Bump actions/checkout from 6 to 7 in /test in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#169</a></li>
<li>Bump the actions group in /lint with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#168</a></li>
<li>Bump actions/checkout from 6 to 7 in /build_sdist in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#170</a></li>
<li>Bump codecov/codecov-action from 6 to 7 in /test by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#172</a></li>
<li>Bump actions/checkout from 6 to 7 in /build_wheels in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#171</a></li>
<li>Bump actions/checkout from 6 to 7 in /build_sdist_wheels in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#173</a></li>
<li>Bump pypa/cibuildwheel from 3.4.1 to 4.1.0 in /build_wheels by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#174</a></li>
<li>Bump actions/checkout from 6 to 7 in /deploy_sphinx_docs_multiversion in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#177</a></li>
<li>Bump the actions group in /build_sphinx_docs with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#175</a></li>
<li>Bump actions/checkout from 6 to 7 in /check_tag_on_main in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#176</a></li>
<li>Bump actions/setup-python from 6 to 7 in /build_sphinx_docs in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#186</a></li>
<li>Bump actions/setup-python from 6 to 7 in /lint in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#184</a></li>
<li>Bump actions/setup-python from 6 to 7 in /check_manifest in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#183</a></li>
<li>Bump actions/setup-python from 6 to 7 in /test in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#182</a></li>
<li>Bump pypa/cibuildwheel from 4.1.0 to 4.1.1 in /build_wheels by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#185</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/AlgoFoe"><code>@​AlgoFoe</code></a> made their first contribution in <a href="">neuroinformatics-unit/actions#164</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/neuroinformatics-unit/actions/compare/v2...v3.0.0">https://github.com/neuroinformatics-unit/actions/compare/v2...v3.0.0</a></p>
<h2>v2.13.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Use tox-uv in test action by <a href="https://github.com/niksirbi"><code>@​niksirbi</code></a> in <a href="">neuroinformatics-unit/actions#136</a></li>
<li>Bump pypa/cibuildwheel from 3.3.0 to 3.3.1 in /build_wheels by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">neuroinformatics-unit/actions#137</a></li>
<li>Add option for passing github token to build sphinx docs action by <a href="https://github.com/niksirbi"><code>@​niksirbi</code></a> in <a href="">neuroinformatics-unit/actions#138</a></li>
<li>Use artifact.ci main repo upload action by <a href="https://github.com/lochhh"><code>@​lochhh</code></a> in <a href="">neuroinformatics-unit/actions#141</a></li>
<li>Configure dependabot for check_tag_on_main, deploy_sphinx_docs_multiversion, upload_pypi by <a href="https://github.com/lochhh"><code>@​lochhh</code></a> in <a href="">neuroinformatics-unit/actions#142</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>34bedfd</code></a> Bump pypa/cibuildwheel from 4.1.0 to 4.1.1 in /build_wheels (<a href="">#185</a>)</li>
<li><a href=""><code>5a9c20c</code></a> Bump actions/setup-python from 6 to 7 in /test in the actions group (<a href="">#182</a>)</li>
<li><a href=""><code>47b3011</code></a> Bump actions/setup-python from 6 to 7 in /check_manifest in the actions group...</li>
<li><a href=""><code>9643bfa</code></a> Bump actions/setup-python from 6 to 7 in /lint in the actions group (<a href="">#184</a>)</li>
<li><a href=""><code>da5d553</code></a> Bump actions/setup-python from 6 to 7 in /build_sphinx_docs in the actions gr...</li>
<li><a href=""><code>57848cb</code></a> Remove <code>upload_pypi</code> action (<a href="">#181</a>)</li>
<li><a href=""><code>8fae58c</code></a> Update headless setup and install input (<a href="">#180</a>)</li>
<li><a href=""><code>b5d6cbc</code></a> Bump actions/checkout in /check_tag_on_main in the actions group (<a href="">#176</a>)</li>
<li><a href=""><code>55fbf70</code></a> Bump the actions group in /build_sphinx_docs with 2 updates (<a href="">#175</a>)</li>
<li><a href=""><code>35b5fe3</code></a> Bump actions/checkout (<a href="">#177</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/neuroinformatics-unit/actions/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=neuroinformatics-unit/actions&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f84eb03eb90c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.