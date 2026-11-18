# Issue

**Title:** Speed up and improve memory use when loading VIA tracks file

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
We noticed that reading a bbox dataset from a VIA tracks file could be very slow, especially for files with a lot of frames and individuals. In this PR I made several changes to improve this.

**What does this PR do?**
This PR makes changes mainly the validation of VIA tracks files and their loading as `movement` datasets.

* Previously in the validator I prioritised keeping the logic of each validation step independent. However, this makes everything very slow with very large files, because I would loop through the data several times (almost one per check). I have now changed the validator to reduce the number of times we loop through the data, while keeping the logic separate. 
    - We still do two passes through the data: one in `_file_contains_valid_frame_numbers` and one in `_file_contains_tracked_bboxes`. I contemplated doing one pass instead (see ) but the benefit seemed small and I went for clarity instead. Happy to hear thoughts though.

* There was some redundancy between the validator checks and the loader. This is because during validation we checked variables that are also needed to build the dataset. For example, we check if the frame numbers are defined correctly and it is possible to extract integers from them. At the time, we prioritised keeping the validation and the loading logic separate, but again this redundancy slows things down with larger files. I have changed the validator to also pre-parse the required data for loading (x, y, width, height, frame number, track IDs, and preliminary confidence values). These data are collected as attributes of the file validator, and the file validator object is the input to the loading function. This blurs the boundaries between validator and loader, but reduces the redundancy.

    * As a result, the loading module has become quite simplified: it now retrieves the relevant data from the validation object, formats it as a dataframe, fills in empty ID-frame combinations with nans and extracts the relevant numpy arrays from it.

* In the validator, I replaced `ast.eval_literal` by `orjson.loads`, which gave us some extra speedups. Other improvements include:
	- replacing split and stack of numpy arrays by a more efficient approach
	- replacing float64 numpy array with float32 (consistent with `poses`, reduces memory footprint; this also affects the exporting function)
	- adapting the tests

* I also modified how the path to the pytest plugins is defined ( in `tests/conftest.py`), since at the moment it requires the tests to be launched from the root directory.

### memory use improvements (update 13/3/2026)
I was getting OOM for large but not enormous files so I investigated. I added some more changes for better memory management. These are:
* replace list of floats by numpy arrays for the preparse data held in the validator
* skip entirely the pandas dataframe intermediate step and operate in numpy directly (the dreamland 🌈)
* adapt tests

These fixes took me from a ratio peak-to-final memory of 3.9 (🙀) to 1.0 (🎉). It was very fun to investigate and fix this with Claude.

## References

I benchmarked `from_via_tracks_file` on a few files I have access to, that represent realistic datasets of many individuals and frames. Below are the median values (in seconds except when specified). 

When two values are shown, the first one refers to the bulk of the original loading function, `_df_from_via_tracks_file`, which takes place after validation (but note the function is refactored and renamed with this PR).

| VIA tracks csv file (size on disk)               | n coords                          | before   (`main`)                                | after loading improvements | after validator improvements | plus orjson  |
| ------------------- | --------------------------------- | ---------------------------------------- | -------------------------- | ---------------------------- | ------------ |
| small 34MB | time: 2067 <br>individuals: 144    | 23 // 36    | 0.8 // 9   | ..// 0.89    | .. // 0.53  |
| medium 100MB   | time: 6553 <br>individuals: 295    |   1min 8s // 2min 33s      | 2.6 // 75.1  | ..// 2.7   | .. // 1.7   |
| medium 400MB        | time: 27489 <br>individuals: 602   |   ... // 28min (* with `timeit`)      |     | ..// 11.7    | .. // 8.0  |
| large 1.8GB         | time: 108922 <br>individuals: 4968 |    (did not benchmark)        |      | ..// ~3min         |      ..// 2min 32s         |


I attach the `pytest-benchmark` results for the first and the last two columns in the table above (the first column is the `before` json, the last two columns are the `after` json and the `after_orjson` json).
[0005_before_small_34mb.json](https://github.com/user-attachments/files/24936145/0005_before_small_34mb.json)
[0011_before_medium_100mb_data.json](https://github.com/user-attachments/files/24937925/0011_before_medium_100mb_data.json)

[0005_after_small_34mb_data.json](https://github.com/user-attachments/files/24935792/0005_after_small_34mb_data.json)
[0004_after_medium_100mb_data.json](https://github.com/user-attachments/files/24935791/0004_after_medium_100mb_data.json)
[0003_after_medium_400mb_data.json](https://github.com/user-attachments/files/24935790/0003_after_medium_400mb_data.json)
[0006_after_large_2gb_data.json](https://github.com/user-attachments/files/24935793/0006_after_large_2gb_data.json)

[0007_after_orjson_small_34mb_data.json](https://github.com/user-attachments/files/24935794/0007_after_orjson_small_34mb_data.json)
[0008_after_orjson_medium_100mb_data.json](https://github.com/user-attachments/files/24935795/0008_after_orjson_medium_100mb_data.json)
[0009_after_orjson_medium_400mb_data.json](https://github.com/user-attachments/files/24935796/0009_after_orjson_medium_400mb_data.json)
[0010_after_orjson_large_2gb_data.json](https://github.com/user-attachments/files/24935797/0010_after_orjson_large_2gb_data.json)

(Note that the commit ID in the .json files here may not exactly match the actual code that was run, because I ran it with changes in the working directory, and noticed this a bit too late).

## orjson vs json

I would like to know other's opinions on replacing `json` by [orjson](https://github.com/ijl/orjson).

The migration seems worth a separate PR, the main difference between them being that `orjson.dumps()` returns bytes, not str, and that it does not have an `indent` parameter. Without this being an exhaustive review, I highlight some of the differences from their docs and from consulting with Claude:

```python
# Standard json - returns str
json.dumps({"key": "value"})  # '{"key": "value"}'

# orjson - returns bytes
orjson.dumps({"key": "value"})  # b'{"key": "value"}'

# If you need a string (common for CSV columns, attributes, etc.):
orjson.dumps({"key": "value"}).decode("utf-8")

#################
# Re: indent, before
json.dumps(data, indent=2)

# after
orjson.dumps(data, option=orjson.OPT_INDENT_2).decode("utf-8")
```

Apparently file I/O also differs:
```python
# Before - json.load() / json.dump() with file objects
with open("file.json") as f:
    data = json.load(f)

with open("file.json", "w") as f:
    json.dump(data, f)

# After - orjson doesn't have load()/dump(), use loads()/dumps()
with open("file.json", "rb") as f:  # Note: 'rb' for bytes
    data = orjson.loads(f.read())

with open("file.json", "wb") as f:  # Note: 'wb' for bytes
    f.write(orjson.dumps(data))
```

One option could be to allow them to co-exist in `movement` for a while (we use `orjson` for loading VIA tracks files for now, and open an issue for migration in the future).

## single loop

Below some results for the single loop , timing `from_via_tracks_file` (median values, in seconds unless specified).

| VIA tracks csv file (size on disk)               | n coords             | plus orjson (two loops)  | single loop |
| ---------- | ---------------- | ---------------------- | -------------------------- | 
| small 34MB | time: 2067 <br>individuals: 144      | 0.53  |     0.55     |
| medium 100MB   | time: 6553 <br>individuals: 295    |   1.7   |     1.7     |
| medium 400MB        | time: 27489 <br>individuals: 602   |   8.0  |   8.0      |
| large 1.8GB         | time: 108922 <br>individuals: 4968 |     2min 32s |    2min 44s      |

[0015_one_loop_small_34mb_data.json](https://github.com/user-attachments/files/25011071/0015_one_loop_small_34mb_data.json)
[0016_one_loop_medium_100mb_data.json](https://github.com/user-attachments/files/25011072/0016_one_loop_medium_100mb_data.json)
[0017_one_loop_medium_400mb_data.json](https://github.com/user-attachments/files/25011073/0017_one_loop_medium_400mb_data.json)
[0018_one_loop_large_2gb_data.json](https://github.com/user-attachments/files/25012212/0018_one_loop_large_2gb_data.json)

(the commit IDs for the `one_loop` runs match the exact code benchmarked)

## How has this PR been tested?

Tests pass locally and in CI.

## Is this a breaking change?

No, only private functions are modified.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7f6b1bed1a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.