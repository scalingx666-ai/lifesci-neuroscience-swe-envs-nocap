# Issue

**Title:** [1/3] Fastgraph: Customize SPES (Nihon Kohden)

## Description

This PR is the first part required for [Fastgraph](https://pubmed.ncbi.nlm.nih.gov/32086098/). It involves customizing the raw data.

# Customize SPES (Nihon Kohden)
Linked to `process_customize_spes_nk` and it does the following:

- Finds Nihon Kohden "Stim Start" and "Stim Stop" events
- If provided, renames those stimulation block events
- Detects individual analog stimulation trigger pulses within each stimulation block
- If provided, adds a fixed time offset to stimulation trigger event
- If provided, splits detected trigger pulses into ODD and EVEN events, useful for alternating monophasic stimulation study (useful for studying Fastgraph plots - 3rd PR).

## The GUI
<img width="448" height="424" alt="image" src="https://github.com/user-attachments/assets/1c24fc27-9be6-4d49-82fc-b10fbba1d00d" />

## Inputs
- **<ins>Update stimulation start/stop event label</ins>**: Gives an option to the user to rename the `Stim Start` and `Stim Stop` labels in the imported NK events if they want to. In this case, we are shortening the labels to `SB` and `SE` respectively. Came as a requirement from UTH as the channel names can get very long, thereby making the overall stimulation event label very long.
-  **<ins>Stimulation trigger channel</ins>**: The stimulation trigger channel in the recordings (here, `DC10`)
-  **<ins>Update stimulation trigger label</ins>**:  Gives an option to the user to rename the stimulation trigger event label (here `DC10`) in the raw NK events if they want to (here, change to `STIM`). Came from UTH, but maybe some other centers might have their own way of naming, so good to have this option.
- **<ins>Buffer time around stimulation block</ins>** (in s):  Required so that it contains the full stimulation segment plus some context before and after it (here, `2s`). Used as a buffer for the time window for detecting the stimulation trigger. 
- **<ins>Trigger time offset</ins>**: Explained in the GUI (see image above)
- **<ins>Add 'ODD' and 'EVEN' events</ins>**: If we check this, then it creates alternating monophasic stimulations from the original stimulation event. This is useful in downstream analysis as the odd and even pulses may produce different responses. We will be using this for Fastgraph plots (3rd PR).

## Steps to use
1. Load in the updated [example test protocol](https://drive.google.com/file/d/1FRylzuAFLCMs584ol9011KdNx3p5XGRE/view?usp=sharing) [ **NOTE**: This preprocessed protocol involves running CAT12 segmentation to get all the anatomical information, the implantation done using Brainstorm, and then loading in the raw data and adding the locations from the implantation to it. These steps will be part of the tutorial].

2. Drag the `Baseline > Link to raw file` to the `Process1` tab and click on `Run > Stimulation > Customize SPES (Nihon Kohden)`.

3. Fill in the values as seen in the GUI figure above. Click `Run`. The raw data gets updated as under:
<img width="464" height="353" alt="Screenshot 2026-04-30 103101" src="https://github.com/user-attachments/assets/c704affe-b4c6-493b-8cf9-acad681c1180" /><br>

- `Stim Start` event label gets replaced by `SB` (short for stim begin - UTH follows this)
- `Stim Stop` event label gets replaced by `SE` (short for stim end - UTH follows this)
- `DC10` triggers were detected, and the event was renamed as `STIM`
- `-1ms` trigger offset is applied to the stimulation trigger events after studying the sample raw data.
- `ODD` and `EVEN` events was created from the `STIM` events above
- **NOTE**: `STIM`, `ODD` and `EVEN` event labels are appended with the stim site information (e.g. `T'3-T'4 4 #1` in the figure above where `T'3-T'4 4` means stimulation was delivered between contacts `T'3` and `T'4` at 4 milliamps and the `#1` means the first session. You can see in the image there is also a 2nd session which is `T'3-T'4 4 #2`. Analyzing each of these sessions separately is required during the downstream analysis, which will be clearer in the 3rd PR.

4. We can then just import the data by dragging the updated `Baseline > Link to raw file` to the `Process1` tab and click on `Run > Import > Import recordings > Import MEG/EEG: Events`. Set event name as `SB` and epoch time `-2000` to `32000`. For this sample data, we will be importing all `SB` events with an epoch of 34s (30s stimulation block with a buffer of 2s around it so that it contains the full stimulation segment plus some context before and after it). A sample below of what it looks like after importing.
<img width="434" height="390" alt="image" src="https://github.com/user-attachments/assets/8de6830e-6c77-49fc-ae78-0dd6e2106ef4" /><br>

## Associated PRs
 1. 
 2. #916 

@jcmosher @Nastaranlotfi @yashvakilna

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8e0234262ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.