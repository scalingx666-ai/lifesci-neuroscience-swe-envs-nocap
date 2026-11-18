# Issue

**Title:** Fix Interval.__getitem__ to accept tuple indexing

## Description

- [x] Fix `Interval.__getitem__` to accept `tuple` type in addition to `int` and `slice`, enabling syntax like `interval[:, 0]`
- [x] Add test `test_interval_getitem_tuple` to verify tuple indexing works correctly
- [x] Fix black formatting: wrap long assert line in test

<!-- START COPILOT ORIGINAL PROMPT -->



<details>

<summary>Original prompt</summary>


----

*This section details on the original issue you should resolve*

<issue_title>Interval `__getitem__` should accept tuple</issue_title>
<issue_description>**Issue**

https://github.com/LorenFrankLab/spyglass/blob/ef61465950e075fe7c2a3164988605556257250e/src/spyglass/common/common_interval.py#L415

- `Interval.__getitem__` only accepts an `int` or `slice` for item
- If called as `interval[ : ,0]`, item is a `tuple`, resulting in error

**Solution** 
expand accepted types


**Example error stack from `LFPArtifactDetection()`**
<details>

```python

ValueError                                Traceback (most recent call last)
Input In [70], in <cell line: 1>()
----> 1 LFPArtifactDetection().populate({'nwb_file_name': 'june20220412_.nwb',
      2                                            'lfp_electrode_group_name': 'all_tets_june',
      3                                            'target_interval_list_name': 'pos 0 valid times',
      4                                            'filter_name': 'LFP 0-400 Hz',
      5                                            'filter_sampling_rate': 30000,
      6                                            'artifact_params_name': 'difference_1000_frac_10_10_frac_10_30ms_80_reference_june'})

File ~/src/spyglass/src/spyglass/utils/mixins/populate.py:98, in PopulateMixin.populate(self, *restrictions, **kwargs)
     96 if use_transact:  # Pass single-process populate to super
     97     kwargs["processes"] = processes
---> 98     return super().populate(*restrictions, **kwargs)
     99 else:  # No transaction protection, use bare make
    100     for key in keys:

File ~/Documents/anaconda3/envs/spyglass_v3/lib/python3.9/site-packages/datajoint/autopopulate.py:319, in AutoPopulate.populate(self, keys, suppress_errors, return_exception_objects, reserve_jobs, order, limit, max_calls, display_progress, processes, make_kwargs, *restrictions)
    313 if processes == 1:
    314     for key in (
    315         tqdm(keys, desc=self.__class__.__name__)
    316         if display_progress
    317         else keys
    318     ):
--> 319         status = self._populate1(key, jobs, **populate_kwargs)
    320         if status is True:
    321             success_list.append(1)

File ~/Documents/anaconda3/envs/spyglass_v3/lib/python3.9/site-packages/datajoint/autopopulate.py:397, in AutoPopulate._populate1(self, key, jobs, suppress_errors, return_exception_objects, make_kwargs)
    395 try:
    396     if not is_generator:
--> 397         make(dict(key), **(make_kwargs or {}))
    398     else:
    399         # tripartite make - transaction is delayed until the final stage
    400         gen = make(dict(key), **(make_kwargs or {}))

File ~/src/spyglass/src/spyglass/lfp/v1/lfp_artifact.py:222, in LFPArtifactDetection.make(self, key)
    215     ref = False if is_diff else None
    217 data = lfp_data if is_diff else lfp_eseries
    219 (
    220     artifact_removed_valid_times,
    221     artifact_times,
--> 222 ) = ARTIFACT_DETECTION_ALGORITHMS[algorithm](
    223     data,
    224     **params,
    225     sampling_frequency=sampling_frequency,
    226     timestamps=lfp_eseries.timestamps if is_diff else None,
    227     referencing=ref,
    228 )
    230 key.update(
    231     dict(
    232         artifact_times=artifact_times,
   (...)
    235     )
    236 )
    238 interval_key = {  # also insert into IntervalList
    239     "nwb_file_name": key["nwb_file_name"],
    240     "interval_list_name": key["artifact_removed_interval_list_name"],
    241     "valid_times": key["artifact_removed_valid_times"],
    242     "pipeline": self.full_table_name,
    243 }

File ~/src/spyglass/src/spyglass/lfp/v1/lfp_artifact_difference_detection.py:192, in difference_artifact_detector(recording, timestamps, amplitude_thresh_1st, amplitude_thresh_2nd, proportion_above_thresh_1st, proportion_above_thresh_2nd, removal_window_ms, local_window_ms, sampling_frequency, referencing)
    187 # these are artifact times - need to subtract these from valid timestamps
    188 artifact_valid_times = Interval(valid_intervals).intersect(
    189     artifact_intervals_s
    190 )
--> 192 starts = np.searchsorted(valid_timestamps, artifact_valid_times[:, 0])
    193 ends = np.searchsorted(valid_timestamps, artifact_valid_times[:, 1])
    194 list_triggers = [np.arange(start, end) for start, end in zip(starts, ends)]

File ~/src/spyglass/src/spyglass/common/common_interval.py:418, in Interval.__getitem__(self, item)
    414     return Interval(self.times[item], **self.kwargs)
    415 # elif isinstance(item, slice):
    416 #     return Interval(self.times[item], **self.kwargs)
    417 else:
--> 418     raise ValueError(
    419         f"Unrecognized item type: {type(item)}. Must be int or slice."
    420     )

ValueError: Unrecognized item type: <class 'tuple'>. Must be int or slice.
```
 <\details></issue_description>

## Comments on the Issue (you are @copilot in this section)

<comments>
</comme...

</details>



<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes LorenFrankLab/spyglass#1550

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0275c2f048b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.