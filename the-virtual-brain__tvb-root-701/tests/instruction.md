# Issue

**Title:** Bump fonttools from 4.38.0 to 4.43.0 in /tvb_library

## Description

Bumps [fonttools](https://github.com/fonttools/fonttools) from 4.38.0 to 4.43.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/releases">fonttools's releases</a>.</em></p>
<blockquote>
<h2>4.43.0</h2>
<ul>
<li>[subset] Set up lxml <code>XMLParser(resolve_entities=False)</code> when parsing OT-SVG documents to prevent XML External Entity (XXE) attacks (9f61271dc): <a href="https://codeql.github.com/codeql-query-help/python/py-xxe/">https://codeql.github.com/codeql-query-help/python/py-xxe/</a></li>
<li>[varLib.iup] Added workaround for a Cython bug in <code>iup_delta_optimize</code> that was leading to IUP tolerance being incorrectly initialised, resulting in sub-optimal deltas (60126435d, <a href="">cython/cython#5732</a>).</li>
<li>[varLib] Added new command-line entry point <code>fonttools varLib.avar</code> to add an <code>avar</code> table to an existing VF from axes mappings in a .designspace file (0a3360e52).</li>
<li>[instancer] Fixed bug whereby no longer used variation regions were not correctly pruned after VarData optimization (<a href="">#3268</a>).</li>
<li>Added support for Python 3.12 (<a href="">#3283</a>).</li>
</ul>
<h2>4.42.1</h2>
<ul>
<li>[t1Lib] Fixed several Type 1 issues (<a href="">#3238</a>, <a href="">#3240</a>).</li>
<li>[otBase/packer] Allow sharing tables reached by different offset sizes (<a href="">#3241</a>, <a href="">#3236</a>, 457f11c2).</li>
<li>[varLib/merger] Fix Cursive attachment merging error when all anchors are NULL (<a href="">#3248</a>, <a href="">#3247</a>).</li>
<li>[ttLib] Fixed warning when calling <code>addMultilingualName</code> and <code>ttFont</code> parameter was not passed on to <code>findMultilingualName</code> (<a href="">#3253</a>).</li>
</ul>
<h2>4.42.0</h2>
<ul>
<li>[varLib] Use sentinel value 0xFFFF to mark a glyph advance in hmtx/vmtx as non participating, allowing sparse masters to contain glyphs for variation purposes other than {H,V}VAR (<a href="">#3235</a>).</li>
<li>[varLib/cff] Treat empty glyphs in non-default masters as missing, thus not participating in CFF2 delta computation, similarly to how varLib already treats them for gvar (<a href="">#3234</a>).</li>
<li>Added varLib.avarPlanner script to deduce 'correct' avar v1 axis mappings based on glyph average weights (<a href="">#3223</a>).</li>
</ul>
<h2>4.41.1</h2>
<ul>
<li>[subset] Fixed perf regression in v4.41.0 by making <code>NameRecordVisitor</code> only visit tables that do contain nameID references (<a href="">#3213</a>, <a href="">#3214</a>).</li>
<li>[varLib.instancer] Support instancing fonts containing null ConditionSet offsets in FeatureVariationRecords (<a href="">#3211</a>, <a href="">#3212</a>).</li>
<li>[statisticsPen] Report font glyph-average weight/width and font-wide slant.</li>
<li>[fontBuilder] Fixed head.created date incorrectly set to 0 instead of the current timestamp, regression introduced in v4.40.0 (<a href="">#3210</a>).</li>
<li>[varLib.merger] Support sparse <code>CursivePos</code> masters (<a href="">#3209</a>).</li>
</ul>
<h2>4.41.0</h2>
<ul>
<li>[fontBuilder] Fixed bug in setupOS2 with default panose attribute incorrectly being set to a dict instead of a Panose object (<a href="">#3201</a>).</li>
<li>[name] Added method to <code>removeUnusedNameRecords</code> in the user range (<a href="">#3185</a>).</li>
<li>[varLib.instancer] Fixed issue with L4 instancing (moving default) (<a href="">#3179</a>).</li>
<li>[cffLib] Use latin1 so we can roundtrip non-ASCII in {Full,Font,Family}Name (<a href="">#3202</a>).</li>
<li>[designspaceLib] Mark <!-- raw HTML omitted --> as optional in docs (as it is in the code).</li>
<li>[glyf-1] Fixed drawPoints() bug whereby last cubic segment becomes quadratic (<a href="">#3189</a>, <a href="">#3190</a>).</li>
<li>[fontBuilder] Propagate the 'hidden' flag to the fvar Axis instance (<a href="">#3184</a>).</li>
<li>[fontBuilder] Update setupAvar() to also support avar 2, fixing <code>_add_avar()</code> call site (<a href="">#3183</a>).</li>
<li>Added new <code>voltLib.voltToFea</code> submodule (originally Tiro Typeworks' &quot;Volto&quot;) for converting VOLT OpenType Layout sources to FEA format (<a href="">#3164</a>).</li>
</ul>
<h2>4.40.0</h2>
<ul>
<li>Published native binary wheels to PyPI for all the python minor versions and platform and architectures currently supported that would benefit from this. They will include precompiled Cython-accelerated modules (e.g. cu2qu) without requiring to compile them from source. The pure-python wheel and source distribution will continue to be published as always (pip will automatically chose them when no binary wheel is available for the given platform, e.g. pypy). Use <code>pip install --no-binary=fonttools fonttools</code> to expliclity request pip to install from the pure-python source.</li>
<li>[designspaceLib|varLib] Add initial support for specifying axis mappings and build <code>avar2</code> table from those (<a href="">#3123</a>).</li>
<li>[feaLib] Support variable ligature caret position (<a href="">#3130</a>).</li>
<li>[varLib|glyf] Added option to --drop-implied-oncurves; test for impliable oncurve points either before or after rounding (<a href="">#3146</a>, <a href="">#3147</a>, <a href="">#3155</a>, <a href="">#3156</a>).</li>
<li>[TTGlyphPointPen] Don't error with empty contours, simply ignore them (<a href="">#3145</a>).</li>
<li>[sfnt] Fixed str vs bytes remnant of py3 transition in code dealing with de/compiling WOFF metadata (<a href="">#3129</a>).</li>
<li>[instancer-solver] Fixed bug when moving default instance with sparse masters (<a href="">#3139</a>, <a href="">#3140</a>).</li>
<li>[feaLib] Simplify variable scalars that don’t vary (<a href="">#3132</a>).</li>
<li>[pens] Added filter pen that explicitly emits closing line when lastPt != movePt (<a href="">#3100</a>).</li>
<li>[varStore] Improve optimize algorithm and better document the algorithm (<a href="">#3124</a>, <a href="">#3127</a>).<br />
Added <code>quantization</code> option (<a href="">#3126</a>).</li>
<li>Added CI workflow config file for building native binary wheels (<a href="">#3121</a>).</li>
<li>[fontBuilder] Added glyphDataFormat=0 option; raise error when glyphs contain cubic outlines but glyphDataFormat was not explicitly set to 1 (<a href="">#3113</a>, <a href="">#3119</a>).</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/blob/main/NEWS.rst">fonttools's changelog</a>.</em></p>
<blockquote>
<h2>4.43.0 (released 2023-09-29)</h2>
<ul>
<li>[subset] Set up lxml <code>XMLParser(resolve_entities=False)</code> when parsing OT-SVG documents
to prevent XML External Entity (XXE) attacks (9f61271dc):
<a href="https://codeql.github.com/codeql-query-help/python/py-xxe/">https://codeql.github.com/codeql-query-help/python/py-xxe/</a></li>
<li>[varLib.iup] Added workaround for a Cython bug in <code>iup_delta_optimize</code> that was
leading to IUP tolerance being incorrectly initialised, resulting in sub-optimal deltas
(60126435d, <a href="">cython/cython#5732</a>).</li>
<li>[varLib] Added new command-line entry point <code>fonttools varLib.avar</code> to add an
<code>avar</code> table to an existing VF from axes mappings in a .designspace file (0a3360e52).</li>
<li>[instancer] Fixed bug whereby no longer used variation regions were not correctly pruned
after VarData optimization (<a href="">#3268</a>).</li>
<li>Added support for Python 3.12 (<a href="">#3283</a>).</li>
</ul>
<h2>4.42.1 (released 2023-08-20)</h2>
<ul>
<li>[t1Lib] Fixed several Type 1 issues (<a href="">#3238</a>, <a href="">#3240</a>).</li>
<li>[otBase/packer] Allow sharing tables reached by different offset sizes (<a href="">#3241</a>, <a href="">#3236</a>).</li>
<li>[varLib/merger] Fix Cursive attachment merging error when all anchors are NULL (<a href="">#3248</a>, <a href="">#3247</a>).</li>
<li>[ttLib] Fixed warning when calling <code>addMultilingualName</code> and <code>ttFont</code> parameter was not
passed on to <code>findMultilingualName</code> (<a href="">#3253</a>).</li>
</ul>
<h2>4.42.0 (released 2023-08-02)</h2>
<ul>
<li>[varLib] Use sentinel value 0xFFFF to mark a glyph advance in hmtx/vmtx as non
participating, allowing sparse masters to contain glyphs for variation purposes other
than {H,V}VAR (<a href="">#3235</a>).</li>
<li>[varLib/cff] Treat empty glyphs in non-default masters as missing, thus not participating
in CFF2 delta computation, similarly to how varLib already treats them for gvar (<a href="">#3234</a>).</li>
<li>Added varLib.avarPlanner script to deduce 'correct' avar v1 axis mappings based on
glyph average weights (<a href="">#3223</a>).</li>
</ul>
<h2>4.41.1 (released 2023-07-21)</h2>
<ul>
<li>[subset] Fixed perf regression in v4.41.0 by making <code>NameRecordVisitor</code> only visit
tables that do contain nameID references (<a href="">#3213</a>, <a href="">#3214</a>).</li>
<li>[varLib.instancer] Support instancing fonts containing null ConditionSet offsets in
FeatureVariationRecords (<a href="">#3211</a>, <a href="">#3212</a>).</li>
<li>[statisticsPen] Report font glyph-average weight/width and font-wide slant.</li>
<li>[fontBuilder] Fixed head.created date incorrectly set to 0 instead of the current
timestamp, regression introduced in v4.40.0 (<a href="">#3210</a>).</li>
<li>[varLib.merger] Support sparse <code>CursivePos</code> masters (<a href="">#3209</a>).</li>
</ul>
<h2>4.41.0 (released 2023-07-12)</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>145460e</code></a> Release 4.43.0</li>
<li><a href=""><code>64f3fd8</code></a> Update changelog [skip ci]</li>
<li><a href=""><code>7aea49e</code></a> Merge pull request <a href="">#3283</a> from hugovk/main</li>
<li><a href=""><code>4470c44</code></a> Bump requirements.txt to support Python 3.12</li>
<li><a href=""><code>0c87cba</code></a> Bump scipy for Python 3.12 support</li>
<li><a href=""><code>eda6fa5</code></a> Add support for Python 3.12</li>
<li><a href=""><code>0e033b0</code></a> Bump reportlab from 3.6.12 to 3.6.13 in /Doc</li>
<li><a href=""><code>6012643</code></a> [iup] Work around cython bug</li>
<li><a href=""><code>b14268a</code></a> [iup] Remove copy/pasta</li>
<li><a href=""><code>0a3360e</code></a> [varLib.avar] New module to compile avar from .designspace file</li>
<li>Additional commits viewable in <a href="https://github.com/fonttools/fonttools/compare/4.38.0...4.43.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=fonttools&package-manager=pip&previous-version=4.38.0&new-version=4.43.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/the-virtual-brain/tvb-root/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcaf75998a84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.