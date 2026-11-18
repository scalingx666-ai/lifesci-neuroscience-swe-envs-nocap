# Issue

**Title:** 603 add scatter plot functionality to electrode locations in topoplots

## Description

The topoplot.m is updated to use scatter plots.

To be able to use that, you can/should include the `scatter`, `on` pair as input arguments. Then the default arguments of the `emarker` can be changed to `{markerchar, color_array, size_vector, linewidth}`.

`size_vector` should be a vector of size `E x 1` that would represent the size of the plotted electrodes. Feel free to multiply the `size_vector` by a scalar (e.g., 5 or 10) if the size of the plotted electrodes is small. `color_array` can be a single letter (such as 'k'), a vector (similar to the `size_vector`)or a `E x 3` array, where `E` represents the number of electrodes.

Here is a working example:
```matlab
% test topoplot scatter mode
%% current implementation
EEG = pop_loadset('filename','eeglab_data_epochs_ica.set','filepath','eeglab/sample_data/');

% default plot
figure; topoplot([],EEG.chanlocs, 'style', 'blank',  'electrodes', 'labelpoint', 'chaninfo', EEG.chaninfo);

%% make the color/size vector
markersize = randi(10, length(EEG.chanlocs),1) * 10; % this will be used for color as well.

cl = floor((markersize-min(markersize)+1) /range(markersize) * 255); % create the color vector
cl(cl>255) = 255;
cl(cl==0) = 1;
cmap = cool(255);

%% scatter mode
% using markersize as the color vector adapts the colors to the default color map
figure;
topoplot([],EEG.chanlocs, 'electrodes', 'labelpoint', 'scatter', 'on', ...
    'emarker',{1:EEG.nbchan,markersize,markersize,1}, 'chaninfo', EEG.chaninfo);
% you can change the color map with uncommenting the line below
% colormap cool

% explicitly giving the colors per electrode (E x 3) would ensure colors
% are rendered as desired. In this case, color of the labels (or numbers) will follow.
figure;
topoplot([],EEG.chanlocs, 'electrodes', 'labelpoint', 'scatter', 'on', ...
    'emarker',{1:EEG.nbchan,cmap(cl,:),markersize,1}, 'chaninfo', EEG.chaninfo);
```

The snippet above generates the following plots:

1- The default plot:
<img width="559" alt="image" src="https://user-images.githubusercontent.com/44906843/230201114-d3da42bc-4c2a-4028-bc9b-e6436481d118.png">

2- The improved plot with color **vector**
<img width="553" alt="image" src="https://user-images.githubusercontent.com/44906843/230200515-9ba6183e-71ca-48af-950c-4cab22079902.png">

3- The improved plot with color **array**
<img width="555" alt="image" src="https://user-images.githubusercontent.com/44906843/230200774-0f204790-4edd-4288-ad54-0310cc023f17.png">

This pull request .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f720b81b35c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.