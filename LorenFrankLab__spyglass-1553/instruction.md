# Issue

**Title:** Fix DataJoint packing error when populating LFPArtifactDetection

## Description

`LFPArtifactDetection.make()` fails with `DataJointError: Packing object of type <class 'spyglass.common.common_interval.Interval'> currently not supported!` because `difference_artifact_detector` returns `Interval` objects instead of `np.ndarray` for artifact times — which DataJoint cannot serialize into `longblob` fields.

- `src/spyglass/lfp/v1/lfp_artifact_difference_detection.py`:
  - Extract `.times` from `Interval.intersect()` result before numpy `[:, 0]`/`[:, 1]` indexing on `artifact_valid_times`
  - Return `artifact_intervals_s.times` instead of the raw `Interval` object, matching the documented `np.ndarray` return type

# Checklist:

- [x] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [x] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

<!-- START COPILOT ORIGINAL PROMPT -->



<details>

<summary>Original prompt</summary>


----

*This section details on the original issue you should resolve*

<issue_title>Packing error when populating LFPArtifactDetection</issue_title>
<issue_description>**Describe the bug**
After you incorporate the changes in ongoing issue LorenFrankLab/spyglass#1550 which fixes the error with not accepting tuples, populating LFPArtifactDetection results in an error with packing object of class `sgc.common_interval.Interval`

**To Reproduce**
1. First incorporate LorenFrankLab/spyglass#1550 
2. The run the following code:
```
LFPArtifactDetection().populate({'nwb_file_name': 'june20220412_.nwb',
 'lfp_electrode_group_name': 'all_tets_june',
 'target_interval_list_name': 'pos 0 valid times',
 'filter_name': 'LFP 0-400 Hz',
 'filter_sampling_rate': 30000,
 'artifact_params_name': 'difference_1000_frac_10_10_frac_10_30ms_80_reference_june'})
```

Error:
```
---------------------------------------------------------------------------
DataJointError                            Traceback (most recent call last)
Input In [21], in <cell line: 1>()
      1 for target_interval_array in all_sleep_pos_intervals:
      2     LFPArtifactDetectionSelection.insert1({'nwb_file_name': nwb_file_name,
      3                                            'lfp_electrode_group_name': 'all_tets_june',
      4                                            'target_interval_list_name': target_interval_array,
   (...)
      7                                            'artifact_params_name': 'difference_1000_frac_10_10_frac_10_30ms_80_reference_june'},
      8                                          skip_duplicates=True)
----> 9     LFPArtifactDetection().populate({'nwb_file_name': nwb_file_name,
     10                                            'lfp_electrode_group_name': 'all_tets_june',
     11                                            'target_interval_list_name': target_interval_array,
     12                                            'filter_name': 'LFP 0-400 Hz',
     13                                            'filter_sampling_rate': 30000,
     14                                            'artifact_params_name': 'difference_1000_frac_10_10_frac_10_30ms_80_reference_june'})

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

File ~/src/spyglass/src/spyglass/lfp/v1/lfp_artifact.py:245, in LFPArtifactDetection.make(self, key)
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
--> 245 LFPArtifactRemovedIntervalList.insert1(key)
    246 IntervalList.insert1(interval_key)
    247 self.insert1(key)

File ~/Documents/anaconda3/envs/spyglass_v3/lib/python3.9/site-packages/datajoint/table.py:349, in Table.insert1(self, row, **kwargs)
    342 def insert1(self, row, **kwargs):
    343     """
    344     Insert one data record into the table. For ``kwargs``, see ``insert()``.
    345 
    346     :param row: a numpy record, a dict-like object, or an ordered sequence to be inserted
    347         as one row.
    348     """
--> 349     self.insert((row,), **kwargs)

File ~/Documents/anaconda3/envs/spyglass_v3/lib/python3.9/site-packages/datajoint/table.py:432, in Table.insert(self, rows, replace, skip_duplicates, ignore_extra_fields, allow_direct_insert)
    430 # collects the field list ...

</details>



<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes LorenFrankLab/spyglass#1552

<!-- START COPILOT CODING AGENT TIPS -->
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad21631d9464`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.