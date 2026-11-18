# Issue

**Title:** Bump isort from 9.0.1 to 9.0.2 in the python-minor-and-patch group

## Description

Bumps the python-minor-and-patch group with 1 update: [isort](https://github.com/PyCQA/isort).

Updates `isort` from 9.0.1 to 9.0.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/PyCQA/isort/releases">isort's releases</a>.</em></p>
<blockquote>
<h2>9.0.2</h2>
<h2>:beetle: Fixes</h2>
<ul>
<li>Preserve blank lines before comment-only sections by <a href="https://github.com/fzlzjerry"><code>@​fzlzjerry</code></a> in <a href="">PyCQA/isort#2655</a></li>
<li>Preserve trailing-comma layout when sorting reexports by <a href="https://github.com/PSR94"><code>@​PSR94</code></a> in <a href="">PyCQA/isort#2605</a></li>
<li>fix: treat EOF on stdin as 'quit' in --interactive prompt by <a href="https://github.com/Eljees"><code>@​Eljees</code></a> in <a href="">PyCQA/isort#2653</a></li>
<li>Fix multi_line_output=10 emitting unparsable code around trailing comments by <a href="https://github.com/dylanpulver"><code>@​dylanpulver</code></a> in <a href="">PyCQA/isort#2651</a></li>
<li>Stop configuration discovery at Git worktree boundaries by <a href="https://github.com/vzer200"><code>@​vzer200</code></a> in <a href="">PyCQA/isort#2654</a></li>
<li>fix: preserve trailing comments when sorting literals by <a href="https://github.com/Manny7717"><code>@​Manny7717</code></a> in <a href="">PyCQA/isort#2647</a></li>
<li>Preserve LF stdin output on Windows by <a href="https://github.com/AleksZyro"><code>@​AleksZyro</code></a> in <a href="">PyCQA/isort#2616</a></li>
<li>Handle star imports better when using parenthesis by <a href="https://github.com/DanielNoord"><code>@​DanielNoord</code></a> in <a href="">PyCQA/isort#2665</a></li>
<li>Sort unwrapped lines in force_sort_within_sections by <a href="https://github.com/DanielNoord"><code>@​DanielNoord</code></a> in <a href="">PyCQA/isort#2667</a></li>
<li>Preserve file line endings when sorting reexports by <a href="https://github.com/vyrnsynx"><code>@​vyrnsynx</code></a> in <a href="">PyCQA/isort#2669</a></li>
<li>Fix float_to_top hoisting indented semicolon imports by <a href="https://github.com/Pajimo"><code>@​Pajimo</code></a> in <a href="">PyCQA/isort#2671</a></li>
<li>Preserve CRLF blank lines during float-to-top preprocessing by <a href="https://github.com/hansu650"><code>@​hansu650</code></a> in <a href="">PyCQA/isort#2683</a></li>
<li>mypy: type-check tests and use pathlib fixtures by <a href="https://github.com/DanielNoord"><code>@​DanielNoord</code></a> in <a href="">PyCQA/isort#2685</a></li>
</ul>
<h2>Other changes</h2>
<ul>
<li>Fix codecov build reports by <a href="https://github.com/DanielNoord"><code>@​DanielNoord</code></a> in <a href="">PyCQA/isort#2666</a></li>
<li>Refactors in <code>process</code> by <a href="https://github.com/DanielNoord"><code>@​DanielNoord</code></a> in <a href="">PyCQA/isort#2677</a></li>
<li>Core developers revision by <a href="https://github.com/staticdev"><code>@​staticdev</code></a> in <a href="">PyCQA/isort#2691</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/PyCQA/isort/compare/9.0.1...9.0.2">https://github.com/PyCQA/isort/compare/9.0.1...9.0.2</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9f90561</code></a> Core developers revision</li>
<li><a href=""><code>4371472</code></a> Fix a &quot;security&quot; issue</li>
<li><a href=""><code>e74b4ba</code></a> Do some formatting and setting updates</li>
<li><a href=""><code>539abb1</code></a> Bump the uv group with 15 updates</li>
<li><a href=""><code>0482160</code></a> Fully type check <code>tests</code> and modernize code</li>
<li><a href=""><code>bbda474</code></a> Bump pypa/cibuildwheel from 4.2.0 to 4.2.1 in the github-actions group</li>
<li><a href=""><code>1fd0701</code></a> Agent Host changes for agents/dependabot-monthly-updates-uv</li>
<li><a href=""><code>6911091</code></a> Always split on <code>parsed.line_separator</code></li>
<li><a href=""><code>3808b70</code></a> Keep CRLF regression cases beside existing check-mode tests</li>
<li><a href=""><code>3202ce8</code></a> Preserve CRLF blank lines during float-to-top preprocessing</li>
<li>Additional commits viewable in <a href="https://github.com/PyCQA/isort/compare/9.0.1...9.0.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=isort&package-manager=pip&previous-version=9.0.1&new-version=9.0.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20bd8805518a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.