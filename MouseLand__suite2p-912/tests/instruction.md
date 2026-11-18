# Issue

**Title:** Bump torch from 1.11.0 to 1.13.1

## Description

Bumps [torch](https://github.com/pytorch/pytorch) from 1.11.0 to 1.13.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytorch/pytorch/releases">torch's releases</a>.</em></p>
<blockquote>
<h2>PyTorch 1.13.1 Release, small bug fix release</h2>
<p>This release is meant to fix the following issues (regressions / silent correctness):</p>
<ul>
<li>RuntimeError by torch.nn.modules.activation.MultiheadAttention with bias=False and batch_first=True <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88669">#88669</a></li>
<li>Installation via pip  on Amazon Linux 2, regression <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88869">#88869</a></li>
<li>Installation using poetry on Mac M1, failure <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88049">#88049</a></li>
<li>Missing masked tensor documentation <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89734">#89734</a></li>
<li>torch.jit.annotations.parse_type_line is not safe (command injection) <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88868">#88868</a></li>
<li>Use the Python frame safely in _pythonCallstack <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88993">#88993</a></li>
<li>Double-backward with full_backward_hook causes RuntimeError <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88312">#88312</a></li>
<li>Fix logical error in get_default_qat_qconfig <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88876">#88876</a></li>
<li>Fix cuda/cpu check on NoneType and unit test <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88854">#88854</a> and <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88970">#88970</a></li>
<li>Onnx ATen Fallback for BUILD_CAFFE2=0 for ONNX-only ops <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88504">#88504</a></li>
<li>Onnx operator_export_type on the new registry <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/87735">#87735</a></li>
<li>torchrun AttributeError caused by file_based_local_timer on Windows <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/85427">#85427</a></li>
</ul>
<p>The <a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89855">release tracker</a> should contain all relevant pull requests related to this release as well as links to related issues</p>
<h2>PyTorch 1.13: beta versions of functorch and improved support for Apple’s new M1 chips are now available</h2>
<h1>Pytorch 1.13 Release Notes</h1>
<ul>
<li>Highlights</li>
<li>Backwards Incompatible Changes</li>
<li>New Features</li>
<li>Improvements</li>
<li>Performance</li>
<li>Documentation</li>
<li>Developers</li>
</ul>
<h1>Highlights</h1>
<p>We are excited to announce the release of PyTorch 1.13! This includes stable versions of BetterTransformer. We deprecated CUDA 10.2 and 11.3 and completed migration of CUDA 11.6 and 11.7. Beta includes improved support for Apple M1 chips and functorch, a library that offers composable vmap (vectorization) and autodiff transforms, being included in-tree with the PyTorch release. This release is composed of over 3,749 commits and 467 contributors since 1.12.1. We want to sincerely thank our dedicated community for your contributions.</p>
<p>Summary:</p>
<ul>
<li>
<p>The BetterTransformer feature set supports fastpath execution for common Transformer models during Inference out-of-the-box, without the need to modify the model. Additional improvements include accelerated add+matmul linear algebra kernels for sizes commonly used in Transformer models and Nested Tensors is now enabled by default.</p>
</li>
<li>
<p>Timely deprecating older CUDA versions allows us to proceed with introducing the latest CUDA version as they are introduced by Nvidia®, and hence allows support for C++17 in PyTorch and new NVIDIA Open GPU Kernel Modules.</p>
</li>
<li>
<p>Previously, functorch was released out-of-tree in a separate package. After installing PyTorch, a user will be able to <code>import functorch</code> and use functorch without needing to install another package.</p>
</li>
<li>
<p>PyTorch is offering native builds for Apple® silicon machines that use Apple's new M1 chip as a beta feature, providing improved support across PyTorch's APIs.</p>
</li>
</ul>
<table>
<thead>
<tr>
<th>Stable</th>
<th>Beta</th>
<th>Prototype</th>
</tr>
</thead>
<tbody>
<tr>
<td><!-- raw HTML omitted --><!-- raw HTML omitted -->Better Transformer<!-- raw HTML omitted --><!-- raw HTML omitted -->CUDA 10.2 and 11.3 CI/CD Deprecation <!-- raw HTML omitted --><!-- raw HTML omitted --></td>
<td><!-- raw HTML omitted --><!-- raw HTML omitted -->Enable Intel® VTune™ Profiler's Instrumentation and Tracing Technology APIs<!-- raw HTML omitted --><!-- raw HTML omitted -->Extend NNC to support channels last and bf16<!-- raw HTML omitted --><!-- raw HTML omitted -->Functorch now in PyTorch Core Library<!-- raw HTML omitted --><!-- raw HTML omitted -->Beta Support for M1 devices<!-- raw HTML omitted --><!-- raw HTML omitted --></td>
<td><!-- raw HTML omitted --><!-- raw HTML omitted -->Arm® Compute Library backend support for AWS Graviton<!-- raw HTML omitted --><!-- raw HTML omitted --> CUDA Sanitizer<!-- raw HTML omitted --><!-- raw HTML omitted --></td>
</tr>
</tbody>
</table>
<p>You can check the blogpost that shows the new features <a href="https://pytorch.org/blog/PyTorch-1.13-release/">here</a>.</p>
<h1>Backwards Incompatible changes</h1>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pytorch/pytorch/blob/master/RELEASE.md">torch's changelog</a>.</em></p>
<blockquote>
<h1>Releasing PyTorch</h1>
<!-- raw HTML omitted -->
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#general-overview">General Overview</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#cutting-a-release-branch-preparations">Cutting a release branch preparations</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#cutting-release-branches">Cutting release branches</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#pytorchpytorch"><code>pytorch/pytorch</code></a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#pytorchbuilder--pytorch-domain-libraries"><code>pytorch/builder</code> / PyTorch domain libraries</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#making-release-branch-specific-changes-for-pytorch">Making release branch specific changes for PyTorch</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#making-release-branch-specific-changes-for-domain-libraries">Making release branch specific changes for domain libraries</a></li>
</ul>
</li>
<li><a href="#drafting-rcs-release-candidates-for-pytorch-and-domain-libraries">Drafting RCs (https://github.com/pytorch/pytorch/blob/master/Release Candidates) for PyTorch and domain libraries</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#release-candidate-storage">Release Candidate Storage</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#release-candidate-health-validation">Release Candidate health validation</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#cherry-picking-fixes">Cherry Picking Fixes</a></li>
</ul>
</li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#promoting-rcs-to-stable">Promoting RCs to Stable</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#additional-steps-to-prepare-for-release-day">Additional Steps to prepare for release day</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#modify-release-matrix">Modify release matrix</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#open-google-colab-issue">Open Google Colab issue</a></li>
</ul>
</li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#patch-releases">Patch Releases</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#patch-release-criteria">Patch Release Criteria</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#patch-release-process">Patch Release Process</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#triage">Triage</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#issue-tracker-for-patch-releases">Issue Tracker for Patch releases</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#building-a-release-schedule--cherry-picking">Building a release schedule / cherry picking</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#building-binaries--promotion-to-stable">Building Binaries / Promotion to Stable</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#hardware--software-support-in-binary-build-matrix">Hardware / Software Support in Binary Build Matrix</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#python">Python</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#tldr">TL;DR</a></li>
</ul>
</li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#accelerator-software">Accelerator Software</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#special-support-cases">Special support cases</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#special-topics">Special Topics</a>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/master/#updating-submodules-for-a-release">Updating submodules for a release</a></li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
<h2>General Overview</h2>
<p>Releasing a new version of PyTorch generally entails 3 major steps:</p>
<ol start="0">
<li>Cutting a release branch preparations</li>
<li>Cutting a release branch and making release branch specific changes</li>
<li>Drafting RCs (Release Candidates), and merging cherry picks</li>
<li>Promoting RCs to stable and performing release day tasks</li>
</ol>
<h2>Cutting a release branch preparations</h2>
<p>Following Requirements needs to be met prior to final RC Cut:</p>
<ul>
<li>Resolve all outstanding issues in the milestones(for example <a href="https://github.com/pytorch/pytorch/milestone/28">1.11.0</a>)before first RC cut is completed. After RC cut is completed following script should be executed from builder repo in order to validate the presence of the fixes in the release branch :</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>49444c3</code></a> [BE] Do not package caffe2 in wheel (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/87986">#87986</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/90433">#90433</a>)</li>
<li><a href=""><code>56de8a3</code></a> Add manual cuda deps search logic (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/90411">#90411</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/90426">#90426</a>)</li>
<li><a href=""><code>a4d16e0</code></a> Fix ATen Fallback for BUILD_CAFFE2=0 for ONNX-only ops (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88504">#88504</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/90104">#90104</a>)</li>
<li><a href=""><code>80abad3</code></a> Handle Tensor.<strong>deepcopy</strong> via clone(), on IPU (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89129">#89129</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89999">#89999</a>)</li>
<li><a href=""><code>73a852a</code></a> [Release only change] Fix rocm5.1.1 docker image (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/90321">#90321</a>)</li>
<li><a href=""><code>029ec16</code></a> Add platform markers for linux only extra_install_requires (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88826">#88826</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89924">#89924</a>)</li>
<li><a href=""><code>197c5c0</code></a> Fix cuda/cpu check on NoneType (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88854">#88854</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/90068">#90068</a>)</li>
<li><a href=""><code>aadbeb7</code></a> Make TorchElastic timer importable on Windows (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/88522">#88522</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/90045">#90045</a>)</li>
<li><a href=""><code>aa94433</code></a> Mark IPU device as not supports_as_strided (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89130">#89130</a>) (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89998">#89998</a>)</li>
<li><a href=""><code>59b4f3b</code></a> Use the Python frame safely in _pythonCallstack (<a href="https://github-redirect.dependabot.com/pytorch/pytorch/issues/89997">#89997</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pytorch/pytorch/compare/v1.11.0...v1.13.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=torch&package-manager=pip&previous-version=1.11.0&new-version=1.13.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/MouseLand/suite2p/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e127bccd6436`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.