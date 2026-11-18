# Issue

**Title:** Enhance `set_random_seed()` function

## Description

This pull request introduces two improvements to the `set_random_seed()` function:

(1) Added Option for TensorFlow Operation Determinism:
* While setting a random seed currently helps control randomness, it does not guarantee reproducibility when running on shared GPUs. Asynchronous execution by multiple threads can still lead to different results even with the same seed and hardware setup. To address this, I’ve added an option to force TensorFlow to use deterministic operations. This is particularly useful for ensuring reproducibility in certain analyses or for debugging purposes. (See [TensorFlow documentation](https://www.tensorflow.org/versions/r2.11/api_docs/python/tf/config/experimental/enable_op_determinism?_gl=1*1pr5u4n*_up*MQ..*_ga*MzQ5NjA1OTAwLjE3MjgzOTQyMTY.*_ga_W0YLR4190T*MTcyODM5NDIxNi4xLjAuMTcyODM5NTI1Ni4wLjAuMA..) for more details).

(2) Refactored Code for Setting Random Seeds:
* The seed-setting logic has been simplified by using [`tf.keras.utils.set_random_seed()`](https://www.tensorflow.org/versions/r2.11/api_docs/python/tf/keras/utils/set_random_seed?_gl=1*s6armi*_up*MQ..*_ga*MjYwMjUxMDAwLjE3MjgzOTcxNTI.*_ga_W0YLR4190T*MTcyODM5NzE1Mi4xLjAuMTcyODM5NzE1Mi4wLjAuMA..), which internally sets the random seeds for Python, NumPy, and TensorFlow. This reduces the code from three lines to one without changing the behaviour.

These changes are backward-compatible and do not affect other scripts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7465762e9a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.