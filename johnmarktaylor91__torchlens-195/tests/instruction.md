# Issue

**Title:** chore(deps-dev): update sentence-transformers requirement from <5,>=2.5 to >=2.5,<6

## Description

Updates the requirements on [sentence-transformers](https://github.com/huggingface/sentence-transformers) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/huggingface/sentence-transformers/releases">sentence-transformers's releases</a>.</em></p>
<blockquote>
<h2>v5.7.0 - GradCache Overhaul, torch.compile Inference, and a Large Batch of Correctness Fixes</h2>
<p>This minor version is a correctness and performance-focused release. It rebuilds all gradient-cached losses on one shared engine, fixing several silently wrong gradients and adding token-based mini-batching for up to 3.9x faster cached-loss training. It also makes <code>model.compile()</code> actually speed up inference, and brings a long list of fixes across embedding quantization, evaluators, hard-negative mining, community detection, and multimodal inputs.</p>
<p>Two changes are marked breaking (🚨): int8/uint8 embedding quantization now clips out-of-range values and floors bucket values, so int8 outputs are no longer bit-identical with earlier versions, and <code>AdaptiveLayerLoss</code>/<code>Matryoshka2dLoss</code> now weight prior-layer losses uniformly by default. There's also a forward-looking deprecation: loading models whose modules import classes from outside <code>sentence_transformers</code> will require <code>trust_remote_code=True</code> from v6.0.</p>
<p>Install this version with</p>
<pre lang="bash"><code># Training + Inference
pip install sentence-transformers[train]==5.7.0
<h1>Inference only, use one of:</h1>
<p>pip install sentence-transformers==5.7.0
pip install sentence-transformers[onnx-gpu]==5.7.0
pip install sentence-transformers[onnx]==5.7.0
pip install sentence-transformers[openvino]==5.7.0</p>
<h1>Multimodal dependencies (optional):</h1>
<p>pip install sentence-transformers[image]==5.7.0
pip install sentence-transformers[audio]==5.7.0
pip install sentence-transformers[video]==5.7.0</p>
<h1>Or combine as needed:</h1>
<p>pip install sentence-transformers[train,onnx,image]==5.7.0
</code></pre></p>
<h2>GradCache overhaul: correct gradients and token-based mini-batching (<a href="">#3862</a>)</h2>
<p>The gradient-cached losses (<code>CachedMultipleNegativesRankingLoss</code>, <code>CachedGISTEmbedLoss</code>, <code>CachedSpladeLoss</code>, the Cross Encoder <code>CachedMultipleNegativesRankingLoss</code>, and <code>MegaBatchMarginLoss</code>) train with large batch sizes at constant memory by embedding in mini-batches and replaying them with cached gradients. Each loss carried its own diverged copy of that machinery. They are now all rebuilt on one shared engine, which fixed several bugs that silently corrupted gradients:</p>
<ul>
<li>Cross Encoder <code>CachedMultipleNegativesRankingLoss</code> on GPU: the backward pass used different dropout masks than the forward pass, silently biasing gradients for every reranker trained with dropout active on CUDA or MPS. CPU training was unaffected.</li>
<li>Running two forward passes before a backward pass (e.g. in custom training loops) made <code>CachedGISTEmbedLoss</code> and the Cross Encoder loss backpropagate the wrong batch's gradients, because the cache was stored on the loss module. The cache now travels with each forward pass's backward hook (the <code>.cache</code> and <code>.random_states</code> loss attributes are gone as a result).</li>
<li><code>Pooling(include_prompt=False)</code> (e.g. Instructor models) mutated the attention mask in place, so the backward re-embedding of every cached loss ran with a different mask than the forward pass.</li>
<li><code>MatryoshkaLoss(GISTEmbedLoss(...))</code>: the guide model overwrote the cached embeddings, so only the largest Matryoshka dimension was actually trained.</li>
</ul>
<p>Along the way, this also fixed an autocast dtype crash in the backward pass and the trainer retaining autograd graphs between logging steps when tracking loss components.</p>
<p><code>MegaBatchMarginLoss</code>'s default mini-batched version is rebuilt on the engine as well. It crashed outright on recent releases, and underneath that, its historical implementation only applied the last mini-batch's gradients. It now trains on the full batch (results will differ, for the better), works with <code>MatryoshkaLoss</code>, evaluates under <code>torch.no_grad</code>, and raises for a third input column instead of silently ignoring it.</p>
<p>The headline feature is <code>mini_batch_num_tokens</code>, available on <code>CachedMultipleNegativesRankingLoss</code>, <code>CachedMultipleNegativesSymmetricRankingLoss</code>, <code>CachedGISTEmbedLoss</code>, <code>CachedSpladeLoss</code>, and <code>MegaBatchMarginLoss</code>. Instead of a fixed number of sequences per mini-batch, mini-batches are greedily packed by total non-padding token count, giving near-constant work per mini-batch on variable-length data:</p>
<pre lang="python"><code>from sentence_transformers import SentenceTransformer
from sentence_transformers.sentence_transformer.losses import CachedMultipleNegativesRankingLoss
<p>model = SentenceTransformer(&quot;microsoft/mpnet-base&quot;)
loss = CachedMultipleNegativesRankingLoss(model, mini_batch_num_tokens=16384)
</code></pre></p>
<p>On the PR's Natural Questions benchmark, cached-loss training with flash attention and a tuned token budget dropped from 715 to 182 seconds (3.9x) versus the previous release, with unchanged quality. The engine also trims trailing padding from each mini-batch, which alone is worth about 26% throughput on the default padded path. The updated <a href="https://sbert.net/docs/sentence_transformer/usage/efficiency.html">training efficiency documentation</a> recommends the smallest token budget that saturates your GPU. <code>mini_batch_size</code> keeps working everywhere as before.</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b2a9529</code></a> [fix] Name the lone suggested parameter in the mine_hard_negatives missing-ne...</li>
<li><a href=""><code>00e696c</code></a> Release v5.7.0</li>
<li><a href=""><code>b69081a</code></a> [fix] Treat a 1-dimensional query embedding as a single query in semantic_sea...</li>
<li><a href=""><code>c9c4250</code></a> Keep queries aligned in semantic_search_seismic when a query matches nothing ...</li>
<li><a href=""><code>6d331a5</code></a> [<code>fix</code>] Support mixed sparse/dense inputs in euclidean and manhattan similari...</li>
<li><a href=""><code>68c8cda</code></a> [fix] Reject num_negatives larger than the range_min/range_max window in mine...</li>
<li><a href=""><code>cfb6d43</code></a> [<code>trainer</code>] Fix eval DataLoader worker leak with dataloader_persistent_worker...</li>
<li><a href=""><code>f6d3a40</code></a> Expand the community window on ties with the threshold (<a href="">#3900</a>)</li>
<li><a href=""><code>0b3fcbd</code></a> Correct the <code>corpus_precision</code> values documented for <code>semantic_search_faiss</code> ...</li>
<li><a href=""><code>62724e7</code></a> Drop FAISS padding placeholders from <code>semantic_search_faiss</code> results (<a href="">#3887</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/huggingface/sentence-transformers/compare/v2.5.0...v5.7.0">compare view</a></li>
</ul>
</details>
<br />

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8a8fdb179fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.