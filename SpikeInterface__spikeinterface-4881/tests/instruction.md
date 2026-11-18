# Issue

**Title:** Store JSON data in zarr SortingAnalyzers as byte arrays instead of object arrays

## Description

This is another peel-off from #4260, the first half of the format change (4 in my review there). zarr-python 3 cannot write object arrays, which is how a zarr `SortingAnalyzer` stores its recording provenance and the dict extension data. I now store their JSON as bytes in a `uint8` array, which any zarr version can write, and old analyzers still load. The scikit-learn models of `principal_components` stay pickled for now as that is a bigger decision and I think it should go on its own PR (this is mostly for me as I need to think on the two issuses separately).

This PR is not a carbon copy of the changes in #4260, as I think there is a small improvement to make. In #4260 the recording `to_dict` is stored as an attribute, which makes sense semantically but is less performant than it could be because of how zarr-python works. zarr-python parses the attributes every time a group is opened, and loading an analyzer with its extensions opens the root group 53 times. The sizes tend not to be large (about 1 MB with motion correction and whitening, for example), but it is a cost that we can avoid. As a concrete example I did the following test:

I took a 30-minute Neuropixels 1.0 recording (384 channels at 30 kHz, int16) preprocessed with a bandpass filter, phase shift and a global common reference, followed by motion correction with a non-rigid motion shaped like the dredge preset produces (1 s bins and 400 µm windows, so 1800 x 10 values), with and without whitening. I stored its provenance as a root attribute of a zarr analyzer with 17 extensions, as #4260 does, and timed loading the analyzer with all its extensions against the same analyzer with a small provenance.

And in short, we have:

**Time to load the zarr SortingAnalyzer and all its extensions, local disk**

| Preprocessing | Provenance | #4260 | This PR |
|---|---|---|---|
| Motion correction | 0.6 MB | 3.2 s | 2.6 s |
| Motion correction and whitening | 1.3 MB | 4.2 s | 2.6 s |

**Time to load the zarr SortingAnalyzer and all its extensions, simulated cloud storage**

| Preprocessing | Provenance | #4260 | This PR |
|---|---|---|---|
| Motion correction | 0.6 MB | 28 s | 22 s |
| Motion correction and whitening | 1.3 MB | 36 s | 23 s |

That is up to 1.5 s locally and 14 s remotely on every load with #4260, growing with the recording duration. Stored as a byte array, the provenance is only read when the recording is loaded, so the analyzer loads as fast as with a small provenance, as it does on main today.

The bigger behavior change, here and in #4260, is that recordings that are not JSON-serializable but used to be pickled into the zarr analyzer are no longer saved. After #4877 these are rare. In spikeinterface, this only affects recordings built on an `NwbRecordingExtractor` opened from a file handle (a minority case), on an `InjectDriftingTemplatesRecording` with a saved sorting, or on templates injected into a pickle-only sorting such as the agreement sorting of a multi-sorting comparison, plus third-party extractors that opt out of JSON. Instead, the analyzer warns:
V
> The recording is not JSON-serializable, so it is not saved in the zarr SortingAnalyzer, which will load without a recording. Use `set_temporary_recording()` after loading to attach it again, or save the SortingAnalyzer in 'binary_folder' format, which keeps it.

This also fixes `get_preprocessing_list_from_analyzer` on the backward compatibility path, and analyzers in the new format can already be loaded with zarr-python 3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4a8add0e78d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.