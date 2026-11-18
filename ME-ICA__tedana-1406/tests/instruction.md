# Issue

**Title:** Bump bokeh from 3.8.2 to 3.9.0

## Description

Bumps [bokeh](https://github.com/bokeh/bokeh) from 3.8.2 to 3.9.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bokeh/bokeh/blob/3.9.0/docs/CHANGELOG">bokeh's changelog</a>.</em></p>
<blockquote>
<h2>2026-03-11      3.9:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#14584</a> <code>Div</code> from <code>bokeh.models.dom</code> raisese ValueError in <code>show</code> call</li>
<li><a href="">#14724</a> Bokeh protocol doesn't use binary encoding in <code>pull-doc-reply</code> message</li>
<li><a href="">#14569</a> [component: bokehjs] Adjust overlay in case of 1D box zoom</li>
<li><a href="">#14799</a> [component: build] Compilation failing with whitespace in path</li>
<li><a href="">#13578</a> [component: tests] Unit tests are failing due to changes in pytest-asyncio</li>
<li><a href="">#14568</a> [component: bokehjs] [BUG] Wheel Zoom Tool and Categorical Axis Range</li>
<li><a href="">#14817</a> MyPy can crash on Bokeh 3.9.0.dev9 code</li>
<li><a href="">#14776</a> [component: bokehjs] Don't add BBox if an axis has fixed position</li>
<li><a href="">#14815</a> [component: bokehjs] Bounds using FactorRanges aren't respected in the first visualization</li>
<li><a href="">#14881</a> Default compression level seems too high</li>
<li><a href="">#14894</a> NoChannelsConfiguredError breaks CI after PR <a href="">#14309</a></li>
<li><a href="">#10706</a> [component: bokehjs] [BUG] DataCube not respecting 'target' arg on initial creation</li>
<li><a href="">#14404</a> bokeh info should handle missing npm more gracefully</li>
<li><a href="">#14502</a> Legends fail to export using bokeh.io.export_svgs</li>
<li><a href="">#14549</a> [component: bokehjs] Updating Div text from hover causes infinite loop</li>
<li><a href="">#14616</a> Add <code>is_silenced</code> function to the public API</li>
<li><a href="">#14645</a> [component: bokehjs] <code>CategoricalSlider</code> shows 'undefined' for some categories when a certain number of categories is given</li>
<li><a href="">#14690</a> [component: bokehjs] Bokehjs test/devtools server examples error on Windows</li>
<li><a href="">#14700</a> [component: tests] Regression test for <a href="">#11339</a> fails randomly since Chrome version upgrade.</li>
<li><a href="">#14709</a> [component: build] ESM minified bundles don't work due to bad imports</li>
<li><a href="">#14730</a> CI sometimes fails on MacOS with &quot;The template is not valid&quot;</li>
<li><a href="">#14744</a> [component: bokehjs] Use <code>outline_width</code> in <code>Legend</code></li>
<li><a href="">#14750</a> [component: bokehjs] Block glyph doesn't account for reversed axes</li>
<li><a href="">#14756</a> [component: build] Build CI job failing</li>
</ul>
</li>
<li>
<p>features:</p>
<ul>
<li><a href="">#14417</a> [component: bokehjs] Cannot scroll or wrap large number of tabs</li>
<li><a href="">#14742</a> [FEATURE] Add padding to step</li>
<li><a href="">#14772</a> [component: bokehjs] Add support for property value editing in <code>Examiner</code> component</li>
<li><a href="">#14779</a> Add support for displaying contents with Markdown syntax</li>
<li><a href="">#14607</a> Enhancements for <code>bokeh settings</code></li>
<li><a href="">#14716</a> [component: bokehjs] [Feature Request] Native Text/Glyph Outline Support (Inspired by Matplotlib PathEffects)</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14346</a> Redesign <code>Dropdown</code> widget to use <code>Menu</code> model</li>
<li><a href="">#14698</a> Use auto_box_zoom as the default tool</li>
<li><a href="">#14786</a> [component: build] Replace <code>ts-node</code> and <code>tsconfig-paths</code> with <code>tsc</code>, ES modules and imports maps</li>
<li><a href="">#14789</a> [component: build] Migrate to eslint 9.x</li>
<li><a href="">#14793</a> Enhance performance of bitset in CDS view</li>
<li><a href="">#14795</a> [component: bokehjs] Enhance performance of indices map in CDS view</li>
<li><a href="">#14782</a> [component: build] Drop <code>baseUrl</code> from <code>tsconfig.json</code> files</li>
<li><a href="">#14802</a> [component: bokehjs] Enhance performance of _value_record_references in has_props</li>
<li><a href="">#14804</a> Pandas 3.0 compatibility</li>
<li><a href="">#14810</a> [component: bokehjs] Use ES2026 <code>UInt8Array.{to,from}Base64</code> if available</li>
<li><a href="">#14816</a> Adapt to new CoW behavior in Pandas 3.0</li>
<li><a href="">#14822</a> Allow to disable linking layouts cross panels in  <code>Tabs</code></li>
<li><a href="">#14824</a> [component: bokehjs] Perform inplace byte swap for big endian conversion</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>daae451</code></a> Deployment updates for release 3.9.0</li>
<li><a href=""><code>14f5d6f</code></a> Update <code>switcher.json</code> for 3.9 release (<a href="">#14920</a>)</li>
<li><a href=""><code>897960e</code></a> Merge deployment staging branch staging-3.9.0rc1</li>
<li><a href=""><code>bd1eaf0</code></a> Deployment updates for release 3.9.0rc1</li>
<li><a href=""><code>b0c83f8</code></a> Revert &quot;Resolve models' and their properties' typing issues (<a href="">#14798</a>)&quot; (<a href="">#14898</a>)</li>
<li><a href=""><code>f4c0d97</code></a> Fix conda channel configuration by using Miniforge + mamba (<a href="">#14892</a>)</li>
<li><a href=""><code>8416793</code></a> Add old sri hash tables (<a href="">#14886</a>)</li>
<li><a href=""><code>fa2ec20</code></a> Add 3.8.x release notes (<a href="">#14885</a>)</li>
<li><a href=""><code>f58aa17</code></a> Update release notes for Bokeh 3.9 (<a href="">#14866</a>)</li>
<li><a href=""><code>f7fd188</code></a> Lower the default compression level to 2 (<a href="">#14883</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/bokeh/bokeh/compare/3.8.2...3.9.0">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2b4655e6650`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.