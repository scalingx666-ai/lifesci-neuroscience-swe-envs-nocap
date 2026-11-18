# Issue

**Title:** Bump j178/prek-action from 1 to 2

## Description

Bumps [j178/prek-action](https://github.com/j178/prek-action) from 1 to 2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek-action/releases">j178/prek-action's releases</a>.</em></p>
<blockquote>
<h2>v2.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Completely rewritten in TypeScript for a more maintainable and modern implementation (<a href="">#76</a>)</li>
<li><code>prek-version</code> now supports semver ranges such as <code>0.3.x</code>, with faster and more reliable version resolution (<a href="">#81</a>, <a href="">#80</a>, <a href="">#92</a>, <a href="">#94</a>, <a href="">#100</a>)</li>
<li>Downloaded <code>prek</code> archives are now validated against known checksums before install (<a href="">#83</a>)</li>
<li>Added <code>show-verbose-logs</code> to control whether verbose <code>prek</code> logs are printed after the run (<a href="">#78</a>)</li>
<li>Improved caching behavior with an explicit <code>cache</code> input, a new <code>cache-hit</code> output, corrected cache path resolution, and fixes for redundant cache saves (<a href="">#91</a>, <a href="">#102</a>, <a href="">#110</a>, <a href="">#111</a>)</li>
<li>Improved Windows install performance by optimizing ZIP extraction (<a href="">#96</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/j178/prek-action/compare/v1...v2.0.0">https://github.com/j178/prek-action/compare/v1...v2.0.0</a></p>
<h2>v2.0.0-beta.6</h2>
<h2>What's Changed</h2>
<ul>
<li>Migrate formatting to Biome by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#103</a></li>
<li>Modernize ESM build and test workflow by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#107</a></li>
<li>Migrate tests to Vitest by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#109</a></li>
<li>Update dependency esbuild to ^0.27.0 by <a href="https://github.com/renovate"><code>@​renovate</code></a>[bot] in <a href="">j178/prek-action#108</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/j178/prek-action/compare/v2.0.0-beta.5...v2.0.0-beta.6">https://github.com/j178/prek-action/compare/v2.0.0-beta.5...v2.0.0-beta.6</a></p>
<h2>v2.0.0-beta.5</h2>
<h2>What's Changed</h2>
<ul>
<li>Add version manifest file by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#101</a></li>
<li>Move version manifest out of bundle by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#100</a></li>
<li>Fix cache path resolution to match prek's own behavior by <a href="https://github.com/shaanmajid"><code>@​shaanmajid</code></a> in <a href="">j178/prek-action#102</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/j178/prek-action/compare/v2.0.0-beta.4...v2.0.0-beta.5">https://github.com/j178/prek-action/compare/v2.0.0-beta.4...v2.0.0-beta.5</a></p>
<h2>v2.0.0-beta.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Improve version resolution fast paths by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#94</a></li>
<li>Optimize Windows zip extraction by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#96</a></li>
<li>Improve manifest update PR details by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#97</a></li>
<li>Update prek version manifest for prek 0.3.6 by <a href="https://github.com/github-actions"><code>@​github-actions</code></a>[bot] in <a href="">j178/prek-action#98</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/github-actions"><code>@​github-actions</code></a>[bot] made their first contribution in <a href="">j178/prek-action#98</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/j178/prek-action/compare/v2.0.0-beta.3...v2.0.0-beta.4">https://github.com/j178/prek-action/compare/v2.0.0-beta.3...v2.0.0-beta.4</a></p>
<h2>v2.0.0-beta.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Add debug logging for version resolution by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#85</a></li>
<li>Rework release workflow for manual dispatch by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#86</a></li>
<li>Document moving major tags in README by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#87</a></li>
<li>ci(renovate): add npm manager, remove stale cargo manager by <a href="https://github.com/shaanmajid"><code>@​shaanmajid</code></a> in <a href="">j178/prek-action#88</a></li>
<li>chore: remove zizmor github-env exception for action.yaml by <a href="https://github.com/shaanmajid"><code>@​shaanmajid</code></a> in <a href="">j178/prek-action#89</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e98a699</code></a> Add musl Linux target support (<a href="">#156</a>)</li>
<li><a href=""><code>dec4adc</code></a> Update known versions for prek 0.4.5 (<a href="">#152</a>)</li>
<li><a href=""><code>e6d8187</code></a> Update npm dev dependencies to v4.1.7 (<a href="">#149</a>)</li>
<li><a href=""><code>37182e4</code></a> Update pre-commit to v2.4.16 (<a href="">#150</a>)</li>
<li><a href=""><code>446c0be</code></a> Update known versions for prek 0.4.4 (<a href="">#145</a>)</li>
<li><a href=""><code>502e92b</code></a> Update dependency semver to v7.8.0 (<a href="">#144</a>)</li>
<li><a href=""><code>5d5dbbc</code></a> Update pre-commit hook biomejs/pre-commit to v2.4.15 (<a href="">#142</a>)</li>
<li><a href=""><code>fa80b57</code></a> Update npm dev dependencies (<a href="">#141</a>)</li>
<li><a href=""><code>de2e771</code></a> Update zizmorcore/zizmor-action action to v0.5.6 (<a href="">#143</a>)</li>
<li><a href=""><code>f2700a3</code></a> Update known versions for prek 0.4.3 (<a href="">#140</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/j178/prek-action/compare/v1...v2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=j178/prek-action&package-manager=github_actions&previous-version=1&new-version=2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `019d225d566f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.