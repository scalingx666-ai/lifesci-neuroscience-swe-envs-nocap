# Issue

**Title:** Store pickled extension data in zarr SortingAnalyzers as byte arrays instead of object arrays

## Description

This is the last peel-off from #4260, the second half of the format change (4 in my review there), and it builds on #4881, so please review that one first. After #4881 the only object arrays left in a zarr `SortingAnalyzer` are the extension data that is not JSON-serializable, which in spikeinterface means the scikit-learn PCA models of `principal_components`. I now store their pickle as bytes in a `uint8` array, the same way #4881 stores JSON. The content is the same as before and the same as the `.pkl` files of `binary_folder`; only the container changes, so a zarr analyzer contains no object arrays at all and #4260 no longer needs a way to write scikit-learn models to zarr. Old analyzers still load.

This is a different approach from #4260, which writes the models with a new helper that saves the estimator's attributes as zarr arrays and JSON. I chose to do what `binary_folder` already does, which is to pickle them, so both formats store the extension data the same way and we don't add a zarr-only serializer to maintain. I think the models should be stored as plain arrays instead of pickles, but that should change both formats at once, so I will propose it in a separate issue.

I also route the legacy `dict` and `object` extension branches through `read_encoded_array`, so the reader of old object arrays under zarr-python 3 in #4260 has a single place to hook into.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5080fb9fd17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.