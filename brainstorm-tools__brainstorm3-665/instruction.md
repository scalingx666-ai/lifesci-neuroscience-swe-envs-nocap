# Issue

**Title:** Add process to export file

## Description

As indicated in the title, this PR adds a the process: `File > Export to file`  which exports **one** or **more** (raw, data, results, timefreq or matrix) files. Under the hood, it wraps the functions `export_INPUTTYPE`. 

The idea of such process is to provide a way to create a script (Generate .m script) with the proper parameters without having to look at the file formats (which are provided in `bst_get('INPUTTYPEout')`

Discussed with in @park-minchul
https://neuroimage.usc.edu/forums/t/export-to-file-as-a-bst-process-or-as-part-of-a-script/43125

# One file 
When exporting one file, the filename and extension for the destination file are required.

Similar to the GUI call for `right-click > File > Export to file`, this process suggest a filename for the target file.

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/f892dbda-bf04-495e-a0c3-74b634473ca0)

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/e5da21b3-15f9-4125-9a86-36c954e374b1)

Script call
```
% Input files
sFiles = {...
    '_TEST_Test/Simulation/matrix_sim_231102_1027.mat'};
RawFiles = {...
    '/home/sim_231102_1027.xlsx'};

% Process: Export to file: Matrix
sFiles = bst_process('CallProcess', 'process_export_file', sFiles, [], ...
    'exportmatrix', {RawFiles{1}, 'EXCEL-TR'});
```

# More than one file
When exporting more than one file, a directory path and and extension for the destination files are required. The filenames of the destination files will be obtained from the filenames in Brainstorm DB. 
 
Similar to the GUI call for `right-click > File > Export to file`, this process suggest a filename for the target file.


![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/65196f99-1652-4993-9c5c-7465eec332fa)

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/0e026276-f81c-4789-b5de-aea6af972f84)

Script call
```
% Input files
sFiles = {...
    'Test/Simulation/matrix_sim_231102_1027.mat', ...
    'Test/Simulation/matrix_sim_231212_1220.mat'};
RawFiles = {...
    '/home'};

% Process: Export to file: Matrix
sFiles = bst_process('CallProcess', 'process_export_file', sFiles, [], ...
    'exportmatrix', {RawFiles{1}, 'EXCEL-TR'});
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9aa2bda568c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.