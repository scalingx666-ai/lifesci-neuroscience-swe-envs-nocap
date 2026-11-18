# Issue

**Title:** (GSoC 2022, 8.2) TVB BIDS data builder and dir monitor module

## Description

Google Summer of Code 2022
Project: [Separate tool to upload data into TVB](https://neurostars.org/t/gsoc-2022-project-idea-8-2-separate-tool-to-upload-data-into-tvb-175-350-h/21392)
Mentors: @popaula937 @liadomide 

This PR contains a module which can build BIDS dataset and import them into TVB projects. Along with this, the module also provides helper class to monitor a BIDS directory and build datasets accordingly when new files are added.

BIDSDataBuilder

- Class for building BIDS dataset by providing 1) a set of json files and BIDS root directory or 2) a datatype from the subject directory (e.g. net, ts, coord, spatial)
- Contains utils for finding all dependencies of a subject's json file
- Produces a zip file
- Takes following args
   - BIDS_ROOT_DIR (reqd.)- BIDS root dir from which dataset will be created
   - BIDS_DATA_TO_IMPORT - Accepts BIDSImporter net, ts, coord, spatial token  to build subject type specific dataset For e.g. if BIDSImporter.TS_TOKEN is provided then, it'll build a dataset containing only TS data and their dependencies
   - INITIAL_JSON_FILES - A set of initial json files with which bids dataset to be built. This is used by BIDSDirWatcher

BIDSDirWatcher

- Class for monitoring a BIDS directory and also builds datasets accordingly on new files
- Runs two threads in parallel for 1) observing a directory and 2) building/importing dataset into TVB
- Importing thread runs on a fixed interval (configurable), which also acts as a buffer time when large files are added
- Contains utils for observing specific (subjects) directories changes only
- Takes following args
    - DIRECTORY_TO_WATCH (reqd.)- BIDS root dir on which is to be monitored
    - UPLOAD_TRIGGER_INTERVAL - Importer thread interval in seconds
    - IMPORT_DATA_IN_TVB - A flag for only creating dataset and storing and not importing into TVB projects
    - TVB_PROJECT_ID - ID of TVB project on which dataset is to be imported


[launch_bids_monitor.py](tvb_framework/tvb/interfaces/rest/bids_monitoring/launch_bids_monitor.py) contains sample code

Build BIDS dataset for time_series

```python
   from tvb.interfaces.rest.bids_monitoring.bids_data_builder import BIDSDataBuilder
   from tvb.adapters.uploaders.bids_importer import BIDSImporter

   bids_data_builder = BIDSDataBuilder(BIDSImporter.TS_TOKEN, BIDS_DIR)
   zip_file_location = bids_data_builder.create_dataset_subjects()
   print(zip_file_location)
```

Monitor a BIDS directory for new files

```python
   from tvb.interfaces.rest.bids_monitoring.bids_dir_monitor import BIDSDirWatcher
   
   bids_dir_watcher = BIDSDirWatcher(
        DIRECTORY_TO_WATCH=BIDS_DIR,
        UPLOAD_TRIGGER_INTERVAL=20,
        IMPORT_DATA_IN_TVB=True
   )
   bids_dir_watcher.init_watcher()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2181bad1c31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.