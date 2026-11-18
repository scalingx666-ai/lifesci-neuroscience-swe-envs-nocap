# Issue

**Title:** [dependabot]: Bump the deps group with 26 updates

## Description

Bumps the deps group with 26 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/filelock) | `4.2.4` | `4.2.7` |
| [pydantic](https://github.com/pydantic/pydantic) | `2.14.1` | `2.14.2` |
| [pyvista](https://github.com/pyvista/pyvista) | `0.49.1` | `0.49.2` |
| [pyvistaqt](https://github.com/pyvista/pyvistaqt) | `0.13.1` | `0.13.2` |
| [prek](https://github.com/j178/prek) | `0.5.7` | `0.5.9` |
| [pytest](https://github.com/pytest-dev/pytest) | `9.1.1` | `9.2.0` |
| [anyio](https://github.com/agronholm/anyio) | `4.15.1` | `4.16.0` |
| [cyclopts](https://github.com/BrianPugh/cyclopts) | `5.3.1` | `5.3.3` |
| [fastjsonschema](https://github.com/horejsek/python-fastjsonschema) | `2.22.2` | `2.22.3` |
| [fonttools](https://github.com/fonttools/fonttools) | `4.67.0` | `4.68.0` |
| [jsonpointer](https://github.com/stefankoegl/python-json-pointer) | `3.6` | `3.8` |
| [narwhals](https://github.com/narwhals-dev/narwhals) | `2.27.1` | `2.28.0` |
| [pip](https://github.com/pypa/pip) | `26.2.2` | `26.3` |
| [platformdirs](https://github.com/tox-dev/platformdirs) | `4.13.5` | `4.14.3` |
| [portalocker](https://github.com/wolph/portalocker) | `4.4.1` | `4.4.2` |
| [pydantic-core](https://github.com/pydantic/pydantic) | `2.50.1` | `2.50.2` |
| [pyobjc-core](https://github.com/ronaldoussoren/pyobjc) | `12.2.2` | `13.0` |
| [pyobjc-framework-cocoa](https://github.com/ronaldoussoren/pyobjc) | `12.2.2` | `13.0` |
| [python-dateutil](https://github.com/dateutil/dateutil) | `3.0.0` | `4.0.0` |
| [pytz](https://github.com/stub42/pytz) | `2026.5` | `2026.6` |
| [pywinpty](https://github.com/andfoy/pywinpty) | `3.1.0` | `3.1.2` |
| [scooby](https://github.com/banesullivan/scooby) | `0.12.0` | `0.12.1` |
| [tzdata](https://github.com/python/tzdata) | `2026.5` | `2026.6` |
| [urllib3-future](https://github.com/jawah/urllib3.future) | `2.25.903` | `2.25.905` |
| [watchdog](https://github.com/gorakhargosh/watchdog) | `6.0.0` | `7.0.0` |
| [wrapt](https://github.com/GrahamDumpleton/wrapt) | `2.5.1` | `2.5.2` |

Updates `filelock` from 4.2.4 to 4.2.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>4.2.7</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Bug fixes</h3>
<ul>
<li>A <code>SoftFileLease</code> reclaims a dead holder's lease marker even when that holder published another <code>lease_duration</code>. It used to raise <code>LeaseSettingsMismatch</code> on every attempt instead, so after a holder crashed and its peers restarted with a changed duration the lock stayed wedged until <code>force_break()</code>. A live holder with another duration still raises (<a href="">#900</a>) by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
</ul>
<p><a href="https://pypi.org/project/filelock/4.2.7/">PyPI release</a></p>
<p><a href="https://github.com/tox-dev/filelock/compare/4.2.6...4.2.7">Full Changelog</a></p>
<h2>4.2.6</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Bug fixes</h3>
<ul>
<li>Fix a race in <code>SoftFileLock</code>, <code>MarkerSoftFileLock</code> and <code>SoftFileLease</code> when three or more contenders reclaim a dead marker. The race could strand a live holder's marker under a break name, leaving the lock unusable or admitting a second holder. Contenders now recheck the marker before exchanging names and unwind nested exchanges in order. If the filesystem refuses a return exchange, the contender leaves its marker at the lock path for later recovery (<a href="">#899</a>) by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
</ul>
<p><a href="https://pypi.org/project/filelock/4.2.6/">PyPI release</a></p>
<p><a href="https://github.com/tox-dev/filelock/compare/4.2.5...4.2.6">Full Changelog</a></p>
<h2>4.2.5</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Bug fixes</h3>
<ul>
<li><code>acquire</code> and <code>acquire</code> raise <code>TypeError</code> for a <em>blocking</em> that is not a <code>bool</code>, as the constructor and the <code>blocking</code> setter already do. A truthy value such as the string <code>&quot;false&quot;</code> used to count as <code>True</code>, so a call meant as a single attempt waited for the instance's <code>timeout</code>, and without a limit at the default <code>-1</code> (<a href="">#870</a>) by <a href="https://github.com/simpleqt"><code>@​simpleqt</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>A <code>SoftFileLock</code> acquisition whose first read of its new marker's identity failed reads it again before rolling back. On Windows the rollback could otherwise not recognize the marker it had created, and the empty marker it left blocked the path for every later acquisition, since no contender breaks an empty marker (<a href="">#869</a>) by <a href="https://github.com/simpleqt"><code>@​simpleqt</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>A <code>fork()</code> child of a process holding a <code>SoftFileLease</code> starts from an unheld claim. It used to inherit the parent's token, last compromise and heartbeat, so <code>token</code> and <code>compromise</code> reported a claim the child never held while <code>is_locked</code> reported it unheld (<a href="">#868</a>) by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>A nested acquire of a held <code>FileLock</code> or <code>SoftFileLock</code> no longer creates the lock file's parent directory. After a rename of that directory during the hold, the nested acquire recreated the old name, and when a file had taken the name it raised <code>FileExistsError</code> and left the hold's recursion count incremented (<a href="">#878</a>) by <a href="https://github.com/0x5t4l1n"><code>@​0x5t4l1n</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>Fix <code>ReadWriteLock</code> failing every acquire with &quot;link directory ... was replaced while opening&quot; in a group-writable directory whose inherited ACL, such as an NFSv4 one on ZFS, opens the link directory to the group. The lock now closes the empty link directory to its owner, and where the filesystem refuses that, such as ZFS with <code>aclmode=restricted</code>, it names the directory to make writable by its owner only (<a href="">#898</a>) by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>Fix <code>SoftFileLock</code>, <code>MarkerSoftFileLock</code> and <code>SoftFileLease</code> raising <code>OverflowError</code> out of <code>acquire()</code>, or never reclaiming a dead holder's lock, when a stranded restore claim beside the lock names a process number outside <code>1..2**31-1</code> or spells it in non-ASCII digits. Such a claim is now ignored, as no filelock writes one (<a href="">#871</a>) by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>Fix soft locks on Windows keeping the marker of a holder that has exited while another process still holds a handle to it, such as a parent's <code>subprocess.Popen</code> after <code>wait()</code> or <code>multiprocessing.Process</code> after <code>join()</code>. Acquiring such a lock with the default <code>timeout=-1</code> waited forever (<a href="">#874</a>) by <a href="https://github.com/nk-batman21"><code>@​nk-batman21</code></a>.</li>
<li>Fix the read-only reopen of a lock file this account cannot write resolving a relative path against the working directory of the moment. A <code>chdir</code> between the refused <code>O_RDWR</code> open and the reopen made the acquisition wait on a file that is not there, or probe one in another directory. The reopen now uses the path the acquisition pinned (<a href="">#889</a>) by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>Handle <code>EMLINK</code>, the error FreeBSD reports when a no-follow open refuses a symlink, in a soft reader/writer lock's protocol tree, so heartbeat reports lost ownership there rather than a transient refresh error (<a href="">#866</a>) by <a href="https://github.com/pacocartones"><code>@​pacocartones</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>Resolving <code>ReadWriteLock</code> or <code>AsyncReadWriteLock</code> raises the <code>ImportError</code> when a module other than Python's <code>sqlite3</code> is missing, as in a frozen application that left out a filelock submodule. The names are <code>None</code> only without SQLite (<a href="">#880</a>) by <a href="https://github.com/pintu544"><code>@​pintu544</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Documentation</h3>
<ul>
<li>The lock-probing recipe in the how-to guide probes with <code>blocking=False</code> instead of a tiny <code>timeout</code> (<a href="">#873</a>) by <a href="https://github.com/tongwentao"><code>@​tongwentao</code></a> and <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Packaging</h3>
<ul>
<li>Releases now run on the shared tox-dev/github-workflows pipeline, with a locked release toolchain and generated GitHub Release notes (<a href="">#885</a>) by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<p>.. towncrier-draft-entries:: Unreleased</p>
<p>.. towncrier release notes start</p>
<p>.. _release-4-2-9:</p>
<hr />
<p>4.2.9 (2026-11-04)</p>
<hr />
<p>.. _release-4-2-9-fixed:</p>
<h1>Fixed</h1>
<ul>
<li>:class:<code>~filelock.ReadWriteLock</code>, :class:<code>~filelock.SoftReadWriteLock</code> and their async wrappers now raise
:class:<code>TypeError</code> for a <em>blocking</em> that is not a :class:<code>bool</code>, in the constructor and on acquire, as
:class:<code>~filelock.FileLock</code> already does. Before, <code>blocking=0</code> waited out the full timeout on a contended
:class:<code>~filelock.ReadWriteLock</code> while <code>blocking=False</code> failed at once, and a truthy value such as <code>&quot;false&quot;</code>
turned a single attempt into a blocking wait (:pr:<code>908</code>) by :user:<code>abhishekcpp007</code> and :user:<code>gaborbernat</code>.</li>
</ul>
<p>.. _release-4-2-8:</p>
<hr />
<p>4.2.8 (2026-11-04)</p>
<hr />
<p>.. _release-4-2-8-documentation:</p>
<h1>Documentation</h1>
<ul>
<li>Clarify the platform-specific locking primitive and range used by descriptor locks, and correct the guidance on
interoperating with byte-range lock protocols such as conda's repodata lock (:pr:<code>905</code>) by :user:<code>boyfeiyu</code>.</li>
</ul>
<p>.. _release-4-2-7:</p>
<hr />
<p>4.2.7 (2026-11-02)</p>
<hr />
<p>.. _release-4-2-7-fixed:</p>
<h1>Fixed</h1>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5fd486b</code></a> release 4.2.7</li>
<li><a href=""><code>ff84735</code></a> 🐛 fix(lease): reclaim dead holders after duration changes (<a href="">#900</a>)</li>
<li><a href=""><code>f71acb1</code></a> release 4.2.6</li>
<li><a href=""><code>77eb01a</code></a> 🐛 fix(soft): restore raced stale markers (<a href="">#899</a>)</li>
<li><a href=""><code>b0cc007</code></a> release 4.2.5</li>
<li><a href=""><code>21bc250</code></a> 🐛 fix(rw): close a link directory an ACL opened (<a href="">#898</a>)</li>
<li><a href=""><code>715a8de</code></a> 📝 docs(security): add a threat model and align the policy (<a href="">#896</a>)</li>
<li><a href=""><code>b0f1b73</code></a> 🧪 test: tolerate a preloaded sqlite3 (<a href="">#894</a>)</li>
<li><a href=""><code>a2e26ac</code></a> 🧪 test: count descriptors behind an incomplete /dev/fd (<a href="">#877</a>)</li>
<li><a href=""><code>160141c</code></a> 🐛 fix(import): raise for a missing read-write module (<a href="">#880</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/filelock/compare/4.2.4...4.2.7">compare view</a></li>
</ul>
</details>
<br />

Updates `pydantic` from 2.14.1 to 2.14.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/releases">pydantic's releases</a>.</em></p>
<blockquote>
<h2>v2.14.2 2026-10-29</h2>
<h2>v2.14.2 (2026-10-29)</h2>
<p>This release addresses 2 security issues, <a href="https://github.com/pydantic/pydantic/security/advisories/GHSA-qpmf-fgh3-ff25">https://github.com/pydantic/pydantic/security/advisories/GHSA-qpmf-fgh3-ff25</a> and <a href="https://github.com/pydantic/pydantic/security/advisories/GHSA-3r8g-cqwr-jr29">https://github.com/pydantic/pydantic/security/advisories/GHSA-3r8g-cqwr-jr29</a>.</p>
<h4>Packaging</h4>
<ul>
<li>Bump PyO3 to 0.30.1, jiter to 0.18.0, use <code>PyFrozenDict</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14003</a></li>
<li>Bump speedate to v0.18.0 by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14007</a></li>
<li>Publish <code>pydantic-core</code> wheels for PyPy 8.0 (<code>pp80</code> ABI) by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14083</a></li>
</ul>
<h4>Performance</h4>
<ul>
<li>Avoid Python tuple allocation during model fields validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13955</a></li>
<li>Lazily call repr of values during nested union serialization by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14082</a></li>
<li>Skip decorator field checks when no field decorators exist by <a href="https://github.com/alexmojaki"><code>@​alexmojaki</code></a> in <a href="">#14111</a></li>
<li>Avoid heap allocation for small JSON model field buffers by <a href="https://github.com/alexmojaki"><code>@​alexmojaki</code></a> in <a href="">#14113</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>
<p>Make JSON validation by iteration consistent with Python approach by <a href="https://github.com/davidhewitt"><code>@​davidhewitt</code></a> in <a href="">#13275</a>.</p>
<p>JSON validation now handles field lookup and extra data the same way as Python validation. In particular, keys that only match an
unused alias or field name are now treated as extra data, instead of being silently dropped:</p>
<pre lang="python"><code>from pydantic import BaseModel, ConfigDict
from pydantic.alias_generators import to_camel
<p>class Page(BaseModel):<br />
model_config = ConfigDict(extra='forbid', alias_generator=to_camel)</p>
<pre><code>page_size: int = 10
</code></pre>
<p>Page.model_validate_json('{&quot;page_size&quot;: 50}')</p>
<h1>Before: Page(page_size=10)</h1>
<h1>After: ValidationError (extra_forbidden)</h1>
<p></code></pre></p>
<p>See the <a href="">pull request</a> for the full list of behavior changes.
This change addresses <a href="https://github.com/pydantic/pydantic/security/advisories/GHSA-qpmf-fgh3-ff25">https://github.com/pydantic/pydantic/security/advisories/GHSA-qpmf-fgh3-ff25</a>.</p>
</li>
<li>
<p>Ignore extra data matching a field name in <code>TypedDict</code> and dataclasses with <code>extra=allow</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14090</a>. Addresses <a href="https://github.com/pydantic/pydantic/security/advisories/GHSA-3r8g-cqwr-jr29">https://github.com/pydantic/pydantic/security/advisories/GHSA-3r8g-cqwr-jr29</a>.</p>
</li>
<li>
<p>Fix unpickling of generic classes defined in separate module by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13994</a></p>
</li>
<li>
<p>Support explicit <code>by_alias</code> overriding <code>validate_by_alias</code> in validation JSON schemas by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13997</a></p>
</li>
<li>
<p>Fix mypy plugin crash on deferred empty model by <a href="https://github.com/ilevkivskyi"><code>@​ilevkivskyi</code></a> in <a href="">#14027</a></p>
</li>
<li>
<p>Fix infinite recursion when validating an invalid default with <code>PydanticUseDefault</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14028</a></p>
</li>
<li>
<p>Implement recursion guard for <code>validate_strings()</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14029</a></p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/blob/v2.14.2/HISTORY.md">pydantic's changelog</a>.</em></p>
<blockquote>
<h2>v2.14.2 (2026-10-29)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.14.2">GitHub release</a></p>
<h3>What's Changed</h3>
<h4>Packaging</h4>
<ul>
<li>Bump PyO3 to 0.30.1, jiter to 0.18.0, use <code>PyFrozenDict</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14003</a></li>
<li>Bump speedate to v0.18.0 by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14007</a></li>
<li>Publish <code>pydantic-core</code> wheels for PyPy 8.0 (<code>pp80</code> ABI) by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14083</a></li>
</ul>
<h4>Performance</h4>
<ul>
<li>Avoid Python tuple allocation during model fields validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13955</a></li>
<li>Lazily call repr of values during nested union serialization by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14082</a></li>
<li>Skip decorator field checks when no field decorators exist by <a href="https://github.com/alexmojaki"><code>@​alexmojaki</code></a> in <a href="">#14111</a></li>
<li>Avoid heap allocation for small JSON model field buffers by <a href="https://github.com/alexmojaki"><code>@​alexmojaki</code></a> in <a href="">#14113</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>
<p>Make JSON validation by iteration consistent with Python approach by <a href="https://github.com/davidhewitt"><code>@​davidhewitt</code></a> in <a href="">#13275</a>.</p>
<p>JSON validation now handles field lookup and extra data the same way as Python validation. In particular, keys that only match an
unused alias or field name are now treated as extra data, instead of being silently dropped:</p>
<pre lang="python"><code>from pydantic import BaseModel, ConfigDict
from pydantic.alias_generators import to_camel
<p>class Page(BaseModel):<br />
model_config = ConfigDict(extra='forbid', alias_generator=to_camel)</p>
<pre><code>page_size: int = 10
</code></pre>
<p>Page.model_validate_json('{&quot;page_size&quot;: 50}')</p>
<h1>Before: Page(page_size=10)</h1>
<h1>After: ValidationError (extra_forbidden)</h1>
<p></code></pre></p>
<p>See the <a href="">pull request</a> for the full list of behavior changes.</p>
</li>
<li>
<p>Fix unpickling of generic classes defined in separate module by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13994</a></p>
</li>
<li>
<p>Support explicit <code>by_alias</code> overriding <code>validate_by_alias</code> in validation JSON schemas by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13997</a></p>
</li>
<li>
<p>Fix mypy plugin crash on deferred empty model by <a href="https://github.com/ilevkivskyi"><code>@​ilevkivskyi</code></a> in <a href="">#14027</a></p>
</li>
<li>
<p>Fix infinite recursion when validating an invalid default with <code>PydanticUseDefault</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14028</a></p>
</li>
<li>
<p>Implement recursion guard for <code>validate_strings()</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14029</a></p>
</li>
<li>
<p>Support named tuples in <code>Sequence</code> serialization by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#14033</a></p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>aa540ac</code></a> Update changelog for v2.14.2</li>
<li><a href=""><code>6cde12f</code></a> Update changelog for v2.14.2</li>
<li><a href=""><code>2db7c25</code></a> Fix deep copy of self-referential models</li>
<li><a href=""><code>d783154</code></a> Update changelog for v2.14.2</li>
<li><a href=""><code>df49b6c</code></a> Avoid heap allocation for small JSON model field buffers</li>
<li><a href=""><code>cd93e69</code></a> Skip decorator field checks when no field decorators exist</li>
<li><a href=""><code>2771e57</code></a> Make JSON validation by iteration consistent with Python approach</li>
<li><a href=""><code>8102e3f</code></a> Avoid Python tuple allocation during model fields validation</li>
<li><a href=""><code>dd139b5</code></a> Bump <code>pydantic.v1</code> namespace to v1.10.27</li>
<li><a href=""><code>66155f9</code></a> Prepare release v2.14.2</li>
<li>Additional commits viewable in <a href="https://github.com/pydantic/pydantic/compare/v2.14.1...v2.14.2">compare view</a></li>
</ul>
</details>
<br />

Updates `pyvista` from 0.49.1 to 0.49.2
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>503ae0a</code></a> Bump that version, dawg!</li>
<li><a href=""><code>179bbcd</code></a> Fix boundary edges in ParametricKlein (<a href="">#9457</a>)</li>
<li><a href=""><code>038861a</code></a> Look up arrays by index in <code>DataSetAttributes.values</code> (<a href="">#9418</a>)</li>
<li><a href=""><code>3204a4b</code></a> Release render-window observers in <code>Plotter.close()</code> (<a href="">#9378</a>)</li>
<li><a href=""><code>4315b67</code></a> Pickle <code>pyvista_ndarray</code> as a plain <code>ndarray</code> (<a href="">#9470</a>)</li>
<li>See full diff in <a href="https://github.com/pyvista/pyvista/compare/v0.49.1...v0.49.2">compare view</a></li>
</ul>
</details>
<br />

Updates `pyvistaqt` from 0.13.1 to 0.13.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/pyvistaqt/releases">pyvistaqt's releases</a>.</em></p>
<blockquote>
<h2>v0.13.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Resolve lazy pyvista plotter components on QtInteractor by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">pyvista/pyvistaqt#860</a></li>
<li>Fix <code>test_drag_event</code> on Qt 6.12 by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvistaqt#864</a></li>
<li>Use <code>render_window</code> instead of the deprecated <code>ren_win</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvistaqt#863</a></li>
<li>Fix the eye-dome lighting toggle and the trame export probe by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvistaqt#865</a></li>
<li>Fix holding surface reference by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">pyvista/pyvistaqt#868</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pyvista/pyvistaqt/compare/v0.13.1...v0.13.2">https://github.com/pyvista/pyvistaqt/compare/v0.13.1...v0.13.2</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ad70690</code></a> Fix holding surface reference (<a href="">#868</a>)</li>
<li><a href=""><code>f36da82</code></a> Build(deps-dev): Bump scooby from 0.12.0 to 0.12.1 (<a href="">#866</a>)</li>
<li><a href=""><code>7241acd</code></a> Fix the eye-dome lighting toggle and the trame export probe (<a href="">#865</a>)</li>
<li><a href=""><code>5308f4e</code></a> Build(deps-dev): Bump pytest from 9.1.1 to 9.2.0 (<a href="">#867</a>)</li>
<li><a href=""><code>b8611ae</code></a> Use <code>render_window</code> instead of the deprecated <code>ren_win</code> (<a href="">#863</a>)</li>
<li><a href=""><code>70f15c7</code></a> Fix <code>test_drag_event</code> on Qt 6.12 (<a href="">#864</a>)</li>
<li><a href=""><code>7d48d8e</code></a> Resolve lazy pyvista plotter components on QtInteractor (<a href="">#860</a>)</li>
<li><a href=""><code>d357abf</code></a> Build(deps-dev): Bump sphinx-gallery from 0.21.0 to 0.22.1 (<a href="">#862</a>)</li>
<li><a href=""><code>faf6e30</code></a> Build(deps-dev): Bump scooby from 0.11.2 to 0.12.0 (<a href="">#861</a>)</li>
<li>See full diff in <a href="https://github.com/pyvista/pyvistaqt/compare/v0.13.1...v0.13.2">compare view</a></li>
</ul>
</details>
<br />

Updates `prek` from 0.5.7 to 0.5.9
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/releases">prek's releases</a>.</em></p>
<blockquote>
<h2>0.5.9</h2>
<h2>Release Notes</h2>
<p>Released on 2026-10-30.</p>
<h3>Enhancements</h3>
<ul>
<li>Add <code>normalize-indentation</code> builtin hook (<a href="">#2967</a>)</li>
<li>Allow overriding the uv install version (<a href="">#2923</a>)</li>
<li>Embed dependency metadata in release binaries (<a href="">#2976</a>)</li>
<li>Select musl Bun builds when glibc is unavailable (<a href="">#2972</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Improve workspace discovery performance (<a href="">#2936</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Preserve clean-filtered files during stashing (<a href="">#2915</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
<li><a href="https://github.com/tchernobog"><code>@​tchernobog</code></a></li>
</ul>
<h2>Install prek 0.5.9</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/download/v0.5.9/prek-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://github.com/j178/prek/releases/download/v0.5.9/prek-installer.ps1 | iex&quot;
</code></pre>
<h3>Install prebuilt binaries via Homebrew</h3>
<pre lang="sh"><code>brew install prek
</code></pre>
<h2>Download prek 0.5.9</h2>
<table>
<thead>
<tr>
<th>File</th>
<th>Platform</th>
<th>Checksum</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.9/prek-aarch64-apple-darwin.tar.gz">prek-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.9/prek-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/blob/main/CHANGELOG.md">prek's changelog</a>.</em></p>
<blockquote>
<h2>0.5.9</h2>
<p>Released on 2026-10-30.</p>
<h3>Enhancements</h3>
<ul>
<li>Add <code>normalize-indentation</code> builtin hook (<a href="">#2967</a>)</li>
<li>Allow overriding the uv install version (<a href="">#2923</a>)</li>
<li>Embed dependency metadata in release binaries (<a href="">#2976</a>)</li>
<li>Select musl Bun builds when glibc is unavailable (<a href="">#2972</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Improve workspace discovery performance (<a href="">#2936</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Preserve clean-filtered files during stashing (<a href="">#2915</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
<li><a href="https://github.com/tchernobog"><code>@​tchernobog</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>48c8a3e</code></a> Bump version to 0.5.9</li>
<li><a href=""><code>9f23bb8</code></a> Bump version to 0.5.8 (<a href="">#2978</a>)</li>
<li><a href=""><code>b209d53</code></a> Bump dependencies (<a href="">#2977</a>)</li>
<li><a href=""><code>e935fd6</code></a> Embed dependency metadata in release binaries (<a href="">#2976</a>)</li>
<li><a href=""><code>7ca1efa</code></a> Select musl Bun builds when glibc is unavailable (<a href="">#2972</a>)</li>
<li><a href=""><code>69b23d8</code></a> Detect available glibc and musl runtimes (<a href="">#2975</a>)</li>
<li><a href=""><code>08098ac</code></a> Add <code>normalize-indentation</code> builtin hook (<a href="">#2967</a>)</li>
<li><a href=""><code>aa757d3</code></a> Revert &quot;Add expand-tabs builtin hook (<a href="">#2918</a>)&quot; (<a href="">#2968</a>)</li>
<li><a href=""><code>310a66f</code></a> Lock mise development tool versions (<a href="">#2965</a>)</li>
<li><a href=""><code>36f4502</code></a> Report precise cargo-bloat sizes and symbol changes (<a href="">#2963</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/j178/prek/compare/v0.5.7...v0.5.9">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest` from 9.1.1 to 9.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.2.0</h2>
<h1>pytest 9.2.0 (2026-10-27)</h1>
<h2>Removals and backward incompatible breaking changes</h2>
<ul>
<li>
<p><a href="">#14716</a>: <code>-c</code> now raises a usage error for a path that does not exist, is a directory, or is in a format pytest has no loader for. Such paths were previously either ignored or reported as an unhandled <code>FileNotFoundError</code>.</p>
</li>
<li>
<p><a href="">#8593</a>: The <code>indirect</code>, <code>ids</code> and <code>scope</code> arguments of <code>Metafunc.parametrize() &lt;pytest.Metafunc.parametrize&gt;</code> -- and therefore of <code>@pytest.mark.parametrize &lt;pytest.mark.parametrize ref&gt;</code> -- are now keyword-only.</p>
<p>Passing them positionally was a common source of confusing errors, e.g. <code>parametrize(&quot;arg1&quot;, &quot;arg2&quot;, [(1, 2)])</code> made the argvalues land in <code>indirect</code> and failed with <code>indirect fixture '(1, 2)' doesn't exist</code>; such mistakes now fail with an understandable <code>TypeError</code>. The type annotations have always declared these arguments as keyword-only.</p>
</li>
<li>
<p><a href="">#993</a>: Plugin import failures at startup are now reported and classified instead of escaping as a raw traceback with the accidental exit code <code>1</code>:</p>
<ul>
<li>a plugin that cannot be found -- via <code>-p</code>, <code>pytest_plugins</code> or <code>PYTEST_PLUGINS</code> -- exits with <code>pytest.ExitCode</code> <code>USAGE_ERROR</code> (<code>4</code>), like a <code>conftest.py</code> that fails to import;</li>
<li>a plugin that is found but raises while importing -- including a broken <code>pytest11</code> entry point or a missing plugin dependency -- exits with <code>pytest.ExitCode</code> <code>INTERNAL_ERROR</code> (<code>3</code>), with the traceback preserved.</li>
</ul>
<p><code>pytest.main</code> now returns these codes instead of raising <code>ImportError</code>. Also fixed an <code>IndexError</code> from pytest's own internals when the plugin raised an exception with no arguments.</p>
</li>
</ul>
<h2>Deprecations (removal in next major release)</h2>
<ul>
<li>
<p><a href="">#14742</a>: The private <code>_pytest.python.CallSpec2</code> name has been renamed to <code>CallSpec</code>.
The old <code>CallSpec2</code> alias remains available for now and will be removed in pytest 10 or 11.</p>
</li>
<li>
<p><a href="">#14755</a>: Schedule <em>yield_fixture</em> decorator for removal in pytest 10 or 11.</p>
</li>
<li>
<p><a href="">#14774</a>: Similarly to the deprecation of class-scoped fixtures defined as instance methods in pytest 9.1,
<em>all</em> higher-scoped fixtures (<code>module</code>, <code>package</code>, and <code>session</code>) defined
as instance methods are now deprecated.</p>
<p>They suffer from the same issue the original deprecation only fixed for
class-scoped fixtures, see <code>10819</code> and <code>14011</code>.</p>
</li>
<li>
<p><a href="">#14808</a>: Passing a non-string value to a <code>string</code>-typed ini option now emits a <code>pytest.PytestRemovedIn10Warning</code>. This affects <code>[tool.pytest.ini_options]</code> in <code>pyproject.toml</code>. In pytest 10 this will raise a <code>TypeError</code>, matching the behavior of the corresponding TOML config path.</p>
</li>
<li>
<p><a href="">#7323</a>: Passing <code>bytes</code> to <code>TerminalReporter.write_line()</code> is now deprecated, pass a <code>str</code> instead.</p>
</li>
</ul>
<h2>New features</h2>
<ul>
<li><a href="">#14743</a>: <!-- raw HTML omitted -->Full diff:<!-- raw HTML omitted --> now contains a legend explaining the <!-- raw HTML omitted -->+<!-- raw HTML omitted --> &amp; <!-- raw HTML omitted -->-<!-- raw HTML omitted --> symbols in diff output.</li>
<li><a href="">#2781</a>: When <code>strict_markers</code> is enabled, marker names used in <code>-m</code> expressions are now validated against registered markers.</li>
<li><a href="">#6881</a>: Added the <code>parametrize_long_str_id_strategy</code> configuration option to control how long <code>str</code>/<code>bytes</code> parameter values are handled in auto-generated test IDs. Explicit IDs set via <code>ids=[...]</code> or <code>pytest.param(..., id=...)</code> are not affected. Available strategies: <code>short</code> (default, values over 100 chars fall back to <code>argname+index</code>), <code>sha256</code> (SHA-256 hex digest), <code>legacy</code> (keep full value), and <code>disallow</code> (error requesting explicit IDs).</li>
</ul>
<h2>Improvements in existing functionality</h2>
<ul>
<li><a href="">#10745</a>: A <code>RecursionError</code> whose recursion origin cannot be located now shows only the
first and last 10 stack frames, matching what pytest already did when locating
the origin failed outright. Previously the full traceback -- often around a
thousand near-identical frames -- was rendered, which was both slow and
unreadable. Pass <code>--full-trace</code> to see every frame.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ae1d0ff</code></a> Prepare release version 9.2.0</li>
<li><a href=""><code>143ce31</code></a> pre-commit: exclude codespell on generated release announcements</li>
<li><a href=""><code>532dc5f</code></a> tox: add attrs dependency to regen, needed in reportingdemo.rst</li>
<li><a href=""><code>a7b2446</code></a> Merge pull request <a href="">#15245</a> from pytest-dev/claude/project-thread-9jcf91</li>
<li><a href=""><code>679d09c</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#15266</a>)</li>
<li><a href=""><code>41d12cd</code></a> docs: clarify typing for yield fixtures</li>
<li><a href=""><code>b9022ba</code></a> Merge pull request <a href="">#15182</a> from 1871698/docs/improve-getting-started-description</li>
<li><a href=""><code>16f87a7</code></a> docs: improve getting-started.rst test execution description</li>
<li><a href=""><code>082ed70</code></a> Merge pull request <a href="">#15255</a> from pytest-dev/claude/project-thread-eoi3d6</li>
<li><a href=""><code>ae37a01</code></a> Merge pull request <a href="">#15227</a> from pytest-dev/claude/project-thread-4etye4</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.1.1...9.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `anyio` from 4.15.1 to 4.16.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/agronholm/anyio/releases">anyio's releases</a>.</em></p>
<blockquote>
<h2>4.16.0</h2>
<p><em>New features</em></p>
<ul>
<li>Added <code>BlockingPortal.call_async()</code> for asynchronously calling into an event loop with optional abandonment on cancellation (<a href="">#1342</a>; PR by <a href="https://github.com/davidbrochart"><code>@​davidbrochart</code></a>)</li>
<li>Added SOCK_SEQPACKET support to <code>connect_unix()</code> and <code>create_unix_listener()</code> (<a href="">#1349</a>; PR by <a href="https://github.com/theunkn0wn1"><code>@​theunkn0wn1</code></a>)</li>
</ul>
<p><em>Other changes</em></p>
<ul>
<li>Changed UDP sockets on the asyncio backend to make <code>send()</code> wait until the datagram has been passed to the operating system (<a href="">#1294</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
</ul>
<p><em>Bug fixes</em></p>
<ul>
<li>Fixed documentation implying that <code>use_uvloop=True</code> falls back to the standard event loop when uvloop (winloop on Windows) is not installed, and showed how to skip the corresponding pytest backend variant when the dependency is missing (<a href="">#645</a>; PR by <a href="https://github.com/GruffElixir"><code>@​GruffElixir</code></a>)</li>
<li>Fixed <code>get_current_task()</code> on the asyncio backend raising an opaque <code>TypeError: cannot create weak reference to 'NoneType' object</code> instead of a clear error when called from a callback scheduled via <code>loop.call_soon_threadsafe()</code> (e.g. from within <code>from_thread.run_sync()</code>), where <code>asyncio.current_task()</code> is legitimately <code>None</code> (<a href="">#773</a>; PR by <a href="https://github.com/AmirF194"><code>@​AmirF194</code></a>)</li>
<li>Fixed <code>CancelScope</code> on the asyncio backend swallowing a native <code>Task.cancel()</code> that was delivered in the same event loop iteration as the scope's own cancellation (such as a <code>move_on_after()</code> deadline expiring), which left the host task with a pending cancellation request that never raised <code>CancelledError</code> (<a href="">#1214</a>)</li>
<li>Fixed UDP socket closing hanging if a datagram send was still in flight (<a href="">#1237</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
<li>Fixed concurrent <code>aclose_forcefully()</code> calls on asyncio socket streams returning before the underlying socket was closed (<a href="">#1273</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
<li>Fixed <code>aclose()</code> on sockets not checkpointing, and thus failing to raise a cancellation exception when called inside a cancelled scope (affected UNIX socket streams and UNIX datagram sockets on asyncio, and all sockets on Trio) (<a href="">#1288</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
<li>Fixed <code>aclose()</code> on asyncio TCP socket listeners not checkpointing, and leaking the listening socket if cancelled while another task was waiting in <code>accept()</code> (<a href="">#1289</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
<li>Fixed <code>accept()</code> on asyncio UNIX socket listeners hanging forever, and leaving the listening socket registered with the event loop, when the listener was closed by another task (<a href="">#1289</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
<li>Fixed <code>send()</code> on asyncio TCP and UDP sockets returning normally, despite the data being discarded, when the socket was closed by another task (or, for TCP, the connection was lost) while <code>send()</code> was waiting for the operating system to accept the data (<a href="">#1289</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
<li>Fixed <code>SocketStream.send()</code> on the asyncio backend handing its data to a paused transport after a previous <code>send()</code> was cancelled (<a href="">#1299</a>; PR by <a href="https://github.com/graingert"><code>@​graingert</code></a>)</li>
<li>Fixed <code>sleep()</code> treating a negative delay (including <code>-inf</code>) inconsistently across backends (asyncio returned immediately; Trio raised <code>ValueError</code>) by raising <code>ValueError</code> on all backends (<a href="">#1306</a>; PR by <a href="https://github.com/BetterAndBetterII"><code>@​BetterAndBetterII</code></a>)</li>
<li>Fixed <code>create_tcp_listener()</code> occasionally failing with a message like <code>Could not create 2 listeners with a consistent port</code> when an ephemeral port is requested and IPv6 is enabled and the dual-stack path is not available or a specific local host name was given (<a href="">#1313</a>)</li>
<li>Fixed <code>AsyncFile</code> not shielding against cancellation while closing (<a href="">#1314</a>)</li>
<li>Fixed <code>TemporaryDirectory.cleanup()</code> reacting to cancellation prematurely when the host task was already cancelled, causing the actual cleanup operation to be skipped (<a href="">#1316</a>; PR by <a href="https://github.com/Yasser-Ameur"><code>@​Yasser-Ameur</code></a>)</li>
<li>Fixed a NaN deadline being accepted on asyncio while Trio raised <code>ValueError</code>, which silently disabled the timeout (<code>fail_after(math.nan)</code> returned instead of raising <code>TimeoutError</code>); <code>CancelScope</code> now rejects it on both backends (<a href="">#1317</a>; PR by <a href="https://github.com/dylanpulver"><code>@​dylanpulver</code></a>)</li>
<li>Fixed <code>FileReadStream</code> and <code>FileWriteStream</code> leaving files open when cancelled during context manager exit, including unflushed writes (<a href="">#1318</a>; PR by <a href="https://github.com/Kuang-xianxin"><code>@​Kuang-xianxin</code></a>)</li>
<li>Fixed <code>Condition.notify()</code> and <code>Condition.notify_all()</code> failing when the underlying lock was acquired directly rather than through the condition (<a href="">#1319</a>; PR by <a href="https://github.com/GruffElixir"><code>@​GruffElixir</code></a>)</li>
<li>Fixed importing AnyIO with loaders that do not provide <code>__file__</code>, such as PyOxidizer, raising <code>TypeError</code> instead of falling back to eager imports (<a href="">#1322</a>; PR by <a href="https://github.com/skulitom"><code>@​skulitom</code></a>)</li>
<li>Fixed text receive streams silently discarding incomplete characters at end-of-file instead of applying the configured decoding error handler (<a href="">#1339</a>; PR by <a href="https://github.com/Aurelucien"><code>@​Aurelucien</code></a>)</li>
<li>Fixed <code>Semaphore(fast_acquire=True)</code> losing its fast-acquire behavior when instantiated outside a running event loop (<a href="">#1348</a>; PR by <a href="https://github.com/feiiiiii5"><code>@​feiiiiii5</code></a>)</li>
<li>Fixed <code>BlockingPortalProvider</code> permanently failing with an <code>AttributeError</code> on every subsequent use if the first attempt to start its blocking portal failed (<a href="">#1350</a>; PR by <a href="https://github.com/Yasser-Ameur"><code>@​Yasser-Ameur</code></a>)</li>
<li>Fixed <code>create_udp_socket()</code> silently ignoring the <code>local_port</code> argument when <code>local_host</code> was omitted, making the socket bind to a random ephemeral port instead of the requested one (<a href="">#1351</a>; PR by <a href="https://github.com/januththedev"><code>@​januththedev</code></a>)</li>
<li>Fixed worker threads on the asyncio backend never returning to the idle pool (and thus never being reused or pruned) when a <code>to_thread.run_sync()</code> call was cancelled after it had been queued for the worker but before the worker thread had picked it up (<a href="">#1352</a>; PR by <a href="https://github.com/Zac-HD"><code>@​Zac-HD</code></a>)</li>
<li>Fixed pytest plugin running Hypothesis async tests only on the first parametrized backend instead of each backend (<a href="">#1353</a>; PR by <a href="https://github.com/DYNOSuprovo"><code>@​DYNOSuprovo</code></a>)</li>
<li>Fixed <code>TypeError</code> when subclassing an existing <code>TypedAttributeSet</code> subclass, and this subclass contains type annotations (<a href="">#1358</a>; PR by <a href="https://github.com/pasmud"><code>@​pasmud</code></a>)</li>
<li>Fixed <code>Lock.locked()</code> (and <code>Condition.locked()</code>) raising <code>NoEventLoopError</code> when the lock was created outside a running event loop (<a href="">#1362</a>; PR by <a href="https://github.com/00200200"><code>@​00200200</code></a>)</li>
<li>Fixed <code>connect_tcp()</code> leaking a connected socket when an enclosing cancel scope was cancelled before the connection attempt task group exited (<a href="">#1364</a>; PR by <a href="https://github.com/charan-rathore"><code>@​charan-rathore</code></a>)</li>
<li>Fixed <code>create_connected_udp_socket()</code> silently ignoring <code>local_port</code> when <code>local_host</code> was not given: the local address was left unset, so the OS picked an ephemeral port instead of the requested one (<a href="">#1365</a>; PR by <a href="https://github.com/feiiiiii5"><code>@​feiiiiii5</code></a>)</li>
<li>Fixed <code>BlockingPortalProvider</code> not passing the exception raised in its <code>with</code> block on to the <code>start_blocking_portal()</code> context manager it wraps (<a href="">#1366</a>; PR by <a href="https://github.com/feiiiiii5"><code>@​feiiiiii5</code></a>)</li>
<li>Fixed <code>anyio.itertools.islice()</code> not consuming the first <code>start</code> items when <code>stop &lt;= start</code> (<a href="">#1372</a>; PR by <a href="https://github.com/Rodrigo-Palma"><code>@​Rodrigo-Palma</code></a>)</li>
<li>Fixed <code>BufferedByteReceiveStream.receive_exactly()</code> and <code>receive_until()</code> returning buffered data after explicit closure instead of raising <code>ClosedResourceError</code> (<a href="">#1378</a>; PR by <a href="https://github.com/kokotatan"><code>@​kokotatan</code></a>)</li>
<li>Fixed a TLS stream sending records the peer could no longer decrypt after a cancelled <code>send()</code> lost an already-encrypted record; the stream now raises <code>BrokenResourceError</code> on further use instead (<a href="">#1385</a>; PR by <a href="https://github.com/Kayvan-Zahiri"><code>@​Kayvan-Zahiri</code></a>)</li>
<li>Fixed <code>close()</code> on memory object streams not waking up tasks blocked in <code>send()</code> or <code>receive()</code> on the same stream (<a href="">#1391</a>)</li>
<li>Fixed <code>anyio.itertools.product()</code> acquiring and consuming unused input iterables when <code>repeat=0</code> (<a href="">#1394</a>; PR by <a href="https://github.com/sricharanreddycheruku"><code>@​sricharanreddycheruku</code></a>)</li>
<li>Fixed <code>SpooledTemporaryFile</code> rolling over to disk on writes when <code>max_size</code> is zero (the default) (<a href="">#1397</a>; PR by <a href="https://github.com/fhgffy"><code>@​fhgffy</code></a>)</li>
<li>Fixed Trio UDP sockets remaining open when initialization failed or was cancelled (<a href="">#1400</a>; PR by <a href="https://github.com/adenzhou1350"><code>@​adenzhou1350</code></a>)</li>
<li>Fixed SpooledTemporaryFile.rollover() moving the current file position to the end of the file (<a href="">#1401</a>; PR by <a href="https://github.com/fhgffy"><code>@​fhgffy</code></a>)</li>
<li>Fixed cancellation during temporary directory creation leaving the directory behind while its context manager is retained (<a href="">#1403</a>; PR by <a href="https://github.com/adenzhou1350"><code>@​adenzhou1350</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0ddd02d</code></a> Released version 4.16.0</li>
<li><a href=""><code>576892e</code></a> Fixed certain pending tasks not woken up by the closing of memory object stre...</li>
<li><a href=""><code>02ff4f8</code></a> Added <code>BlockingPortal.call_async()</code> (<a href="">#1343</a>)</li>
<li><a href=""><code>1af29a4</code></a> Moved documentation code snippets into separate, checked files (<a href="">#1445</a>)</li>
<li><a href=""><code>f01c041</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#1448</a>)</li>
<li><a href=""><code>95a0143</code></a> Test with blockbuster and uvloop on Python 3.15 too</li>
<li><a href=""><code>4d51154</code></a> Modernized the memory object stream tests</li>
<li><a href=""><code>1e4b448</code></a> Fixed the as_connectable() example in the networking docs (<a href="">#1442</a>)</li>
<li><a href=""><code>cd21b36</code></a> Fixed <code>TypedAttributeSet</code> not collecting annotations from superclasses (<a href="">#1358</a>)</li>
<li><a href=""><code>b7f8c68</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#1431</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/agronholm/anyio/compare/4.15.1...4.16.0">compare view</a></li>
</ul>
</details>
<br />

Updates `cyclopts` from 5.3.1 to 5.3.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/BrianPugh/cyclopts/releases">cyclopts's releases</a>.</em></p>
<blockquote>
<h2>v5.3.3</h2>
<h2>Bug Fixes</h2>
<ul>
<li>convert NewType nested inside containers and unions to its underlying type by <a href="https://github.com/Enesuygurs"><code>@​Enesuygurs</code></a> in <a href="">BrianPugh/cyclopts#1036</a></li>
<li>show choices for an enum NewType nested in a container or union by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#1038</a></li>
<li>complete default-command positionals alongside subcommands in bash/zsh/fish by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#1037</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Enesuygurs"><code>@​Enesuygurs</code></a> made their first contribution in <a href="">BrianPugh/cyclopts#1036</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/BrianPugh/cyclopts/compare/v5.3.2...v5.3.3">https://github.com/BrianPugh/cyclopts/compare/v5.3.2...v5.3.3</a></p>
<h2>v5.3.2</h2>
<h2>Bug Fixes</h2>
<ul>
<li>Fix enum members in a <code>Literal</code> (including <code>Parameter(choices=Literal[...])</code>) being shown as <code>Color.RED</code> in help, completion and errors instead of the name that parses (<code>red</code>) by <a href="https://github.com/youdie006"><code>@​youdie006</code></a> in <a href="">BrianPugh/cyclopts#1033</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/youdie006"><code>@​youdie006</code></a> made their first contribution in <a href="">BrianPugh/cyclopts#1033</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/BrianPugh/cyclopts/compare/v5.3.1...v5.3.2">https://github.com/BrianPugh/cyclopts/compare/v5.3.1...v5.3.2</a></p>
</blo...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b86a975f4b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.