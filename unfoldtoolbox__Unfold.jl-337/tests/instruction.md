# Issue

**Title:** Bump julia-actions/cache from 2 to 3

## Description

Bumps [julia-actions/cache](https://github.com/julia-actions/cache) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/julia-actions/cache/releases">julia-actions/cache's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0 - Cache on failure (with override)</h2>
<h2>What's Changed</h2>
<h3>Breaking Changes</h3>
<ul>
<li>Caching will now happen when the job fails, with an override to restore the previous behavior via <code>save-always: false</code></li>
</ul>
<h3>Changes</h3>
<ul>
<li>Javascript version of existing action which also saves if job fails by <a href="https://github.com/jkrumbiegel"><code>@​jkrumbiegel</code></a> <a href="https://github.com/penelopeysm"><code>@​penelopeysm</code></a> <a href="https://github.com/IanButterworth"><code>@​IanButterworth</code></a> in <a href="">julia-actions/cache#198</a> <a href="">julia-actions/cache#190</a></li>
<li>Fix retry on failure/cancelled example by <a href="https://github.com/IanButterworth"><code>@​IanButterworth</code></a> in <a href="">julia-actions/cache#174</a></li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>Bump pyTooling/Actions from 4.2.2 to 4.3.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#176</a></li>
<li>Bump dcarbone/install-jq-action from 3.1.1 to 3.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#178</a></li>
<li>Bump actions/cache from 4.2.3 to 4.2.4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#180</a></li>
<li>Bump actions/checkout from 4.2.2 to 5.0.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#182</a></li>
<li>Bump pyTooling/Actions from 4.3.0 to 5.4.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#181</a></li>
<li>Bump actions/cache from 4.2.4 to 4.3.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#184</a></li>
<li>Bump pyTooling/Actions from 5.4.0 to 6.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#183</a></li>
<li>Remove trailing whitespaces from <code>README.md</code> by <a href="https://github.com/giordano"><code>@​giordano</code></a> in <a href="">julia-actions/cache#186</a></li>
<li>Bump pyTooling/Actions from 6.2.0 to 6.6.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#185</a></li>
<li>Bump actions/checkout from 5.0.0 to 6.0.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#189</a></li>
<li>Bump pyTooling/Actions from 6.6.0 to 6.7.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#188</a></li>
<li>Update GitHub Actions checkout action version by <a href="https://github.com/ViralBShah"><code>@​ViralBShah</code></a> in <a href="">julia-actions/cache#187</a></li>
<li>Bump actions/checkout from 6.0.0 to 6.0.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#191</a></li>
<li>Bump actions/cache from 4.3.0 to 5.0.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#192</a></li>
<li>Bump pyTooling/Actions from 6.7.0 to 7.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#193</a></li>
<li>Bump actions/checkout from 6.0.1 to 6.0.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#194</a></li>
<li>Bump actions/cache from 5.0.1 to 5.0.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#195</a></li>
<li>Bump pyTooling/Actions from 7.2.0 to 7.4.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#196</a></li>
<li>Bump pyTooling/Actions from 7.4.2 to 7.5.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/cache#197</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/ViralBShah"><code>@​ViralBShah</code></a> made their first contribution in <a href="">julia-actions/cache#187</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/julia-actions/cache/compare/v2.1.0...v3.0.0">https://github.com/julia-actions/cache/compare/v2.1.0...v3.0.0</a></p>
<h2>v2.1.0 -  New outputs <code>cache-paths</code> and <code>cache-key</code></h2>
<h2>What's Changed</h2>
<h3>New features</h3>
<ul>
<li>Output <code>cache-paths</code> and <code>cache-key</code> as well by <a href="https://github.com/penelopeysm"><code>@​penelopeysm</code></a> in <a href="">julia-actions/cache#169</a></li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>Bump actions/cache from 4.2.0 to 4.2.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">julia-actions/cache#165</a></li>
<li>Link to Github caching docs from README.md by <a href="https://github.com/johnomotani"><code>@​johnomotani</code></a> in <a href="">julia-actions/cache#167</a></li>
<li>Bump actions/cache from 4.2.2 to 4.2.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">julia-actions/cache#172</a></li>
<li>Bump dcarbone/install-jq-action from 3.0.1 to 3.1.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">julia-actions/cache#171</a></li>
<li>Bump pyTooling/Actions from 3.1.1 to 4.2.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">julia-actions/cache#170</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e33b4bf</code></a> Javascript version of existing action which also saves if job fails (<a href="">#198</a>)</li>
<li><a href=""><code>d256f7f</code></a> Bump pyTooling/Actions from 7.4.2 to 7.5.0 (<a href="">#197</a>)</li>
<li><a href=""><code>227b376</code></a> Bump pyTooling/Actions from 7.2.0 to 7.4.2 (<a href="">#196</a>)</li>
<li><a href=""><code>9a3120a</code></a> Bump actions/cache from 5.0.1 to 5.0.3 (<a href="">#195</a>)</li>
<li><a href=""><code>43522e3</code></a> Bump actions/checkout from 6.0.1 to 6.0.2 (<a href="">#194</a>)</li>
<li><a href=""><code>e847269</code></a> Bump pyTooling/Actions from 6.7.0 to 7.2.0 (<a href="">#193</a>)</li>
<li><a href=""><code>2061bcf</code></a> Bump actions/cache from 4.3.0 to 5.0.1 (<a href="">#192</a>)</li>
<li><a href=""><code>c4f3718</code></a> Bump actions/checkout from 6.0.0 to 6.0.1 (<a href="">#191</a>)</li>
<li><a href=""><code>38850d7</code></a> Update GitHub Actions checkout action version (<a href="">#187</a>)</li>
<li><a href=""><code>429bb24</code></a> Bump pyTooling/Actions from 6.6.0 to 6.7.0 (<a href="">#188</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/julia-actions/cache/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=julia-actions/cache&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37eb9788e7de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.