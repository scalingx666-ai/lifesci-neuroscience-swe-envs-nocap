# Issue

**Title:** Update bokeh requirement from <=3.6.2,>=1.0.0 to >=1.0.0,<=3.6.3

## Description

Updates the requirements on [bokeh](https://github.com/bokeh/bokeh) to permit the latest version.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bokeh/bokeh/blob/3.6.3/docs/CHANGELOG">bokeh's changelog</a>.</em></p>
<blockquote>
<h2>2025-02-05    3.6.3:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#13504</a> [component: bokehjs] [BUG] Zooming inverts axis</li>
<li><a href="">#14129</a> [component: bokehjs] [BUG] Double rendering Latex artifact in titles</li>
<li><a href="">#14164</a> [component: bokehjs] SVG backend uses RGB colors in CSS4 notation</li>
<li><a href="">#14180</a> [component: docs] Dead links in the docs</li>
<li><a href="">#14186</a> mypy 1.13.0 fails in <code>branch-3.7</code></li>
<li><a href="">#14196</a> [component: docs] [BUG] Documentation - sample codes in Application &gt; Updating from unlocked callbacks shows an empty plot.</li>
<li><a href="">#14205</a> mypy 1.14.0 fails due to changed stdlib typings</li>
<li><a href="">#14236</a> [component: examples] Airports_map example is broken</li>
<li><a href="">#14242</a> [component: docs] <code>docs</code> CI workflow fails</li>
<li><a href="">#14247</a> <code>GlyphAPI</code> glyph methods do not have correct return annotation when inspected.</li>
<li><a href="">#14261</a> [component: bokehjs] DataTable column sorting unacceptably slow</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14095</a> [component: docs] Improve docs for missing points</li>
<li><a href="">#14144</a> [component: docs] [FEATURE] Unclear docs on &quot;first_steps_2.rst&quot;</li>
<li><a href="">#14173</a> [component: docs] [BUG] Help text for Block x and y coordinates  is incorrect</li>
<li><a href="">#14226</a> [component: examples] [BUG] Surface3D example code for wrapping.py contains an outdated link</li>
<li><a href="">#14274</a> BeautifulSoup emits DeprecationWarning</li>
<li><a href="">#14077</a> Test Bokeh with Python 3.13 rc</li>
<li><a href="">#14267</a> Backports for 3.6.3</li>
<li><a href="">#14278</a> Backports for 3.6.3 part 2</li>
</ul>
</li>
</ul>
<h2>2024-12-03    3.6.2:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#14082</a> [BUG] p.circle(..) can't be added as renderer to PointDrawTool since 3.6</li>
<li><a href="">#14153</a> [component: bokehjs] <code>ScaleBar</code> positioning doesn't work correctly</li>
<li><a href="">#14160</a> [component: docs] Search box on start page has no surrounding line</li>
<li><a href="">#14168</a> [component: bokehjs] [BUG] using add_tile to add multiple layers causes error on JScript side</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14088</a> [component: docs] [BUG] Missing radius parameter in code example</li>
<li><a href="">#14086</a> Update links to sponsor page</li>
<li><a href="">#14155</a> Backports for 3.6.2</li>
</ul>
</li>
</ul>
<h2>2024-11-06    3.6.1:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#14082</a> [BUG] p.circle(..) can't be added as renderer to PointDrawTool since 3.6</li>
<li><a href="">#14090</a> [component: bokehjs] [BUG] Google Chrome 130 fails to draw figure, throws <code>TypeError: Failed to execute 'fill' on 'CanvasRenderingContext2D'</code></li>
<li><a href="">#14107</a> [component: bokehjs] [BUG] Loss of mobile touch scrolling with update to Bokeh 3.6.0</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14096</a> Backports for 3.6.1</li>
</ul>
</li>
</ul>
<h2>2024-09-26      3.6:</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>61f31a3</code></a> Deployment updates for release 3.6.3</li>
<li><a href=""><code>aa2c857</code></a> Merge deployment staging branch staging-3.6.3rc2</li>
<li><a href=""><code>87ed0e3</code></a> Deployment updates for release 3.6.3rc2</li>
<li><a href=""><code>75395e6</code></a> Backports for 3.6.3 part 2 (<a href="">#14278</a>)</li>
<li><a href=""><code>ab8415a</code></a> Merge deployment staging branch staging-3.6.3rc1</li>
<li><a href=""><code>774f04c</code></a> Deployment updates for release 3.6.3rc1</li>
<li><a href=""><code>f6e021e</code></a> Test Bokeh with Python 3.13 rc (<a href="">#14077</a>)</li>
<li><a href=""><code>bbdaeb2</code></a> remove another custom scatter ref</li>
<li><a href=""><code>8d25f70</code></a> remove custom_markers.py reference</li>
<li><a href=""><code>c8d5e59</code></a> show how None behaves (<a href="">#14126</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/bokeh/bokeh/compare/1.0.0...3.6.3">compare view</a></li>
</ul>
</details>
<br />

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93e9c1f44e38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.