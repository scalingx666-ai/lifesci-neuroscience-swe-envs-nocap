# Issue

**Title:** Improve iEEG editing features (`Merge electrodes` and `Add/Remove contacts`)

## Description

This PR adds some new editing features (`Add/Remove contacts` and `Merge electrodes`) for iEEG **(currently focused only on SEEG)** 

 -  **Motivation for these features:**  These features were a motivation from GARDEL tool. During automated detection (using GARDEL) there could be some bad detections due to noisy/poor resolution of CT due to which:
    - Some contacts might be missing for an electrode (in which case the missing contacts needs to be added) 
    ![Screenshot 2025-04-23 075915 - Copy](https://github.com/user-attachments/assets/6386ee8f-6212-4b44-8fed-36d3a90c4fc5)
    - There could be wrong detection of contacts (in which case those contacts needs to be removed)
![Screenshot 2025-04-23 082710](https://github.com/user-attachments/assets/6b02b356-d22c-4b5b-b45c-6d65a81eae86)
    - There could be contacts being grouped into different electrodes even though they should be part of just one (in which case they need to be merged).  
Before: ![Screenshot 2025-04-23 075747](https://github.com/user-attachments/assets/8f29abe2-8d64-4ab9-b3fe-5aee4d1c01cd)
After: ![Screenshot 2025-04-23 075915](https://github.com/user-attachments/assets/a2073715-8885-4b01-a676-680f7f30c740)

   
- **Why to have them in Brainstorm ?** 
   - In Brainstorm the plan is to have a button that would be calling GARDEL's automatic detection routine (without having to use their GUI). The detected contacts would be saved as Brainstorm channels. In this case it would be good to have these features within Brainstorm GUI as well to allow better post-processing. 
   **Note:** The `Merge Electrodes` feature is not something that is required if user does implantation just using Brainstorm but would be good to have considering future GARDEL integration.
   - Another use case as @tmedani pointed could be for handling non-uniform electrodes (for now). Brainstorm currently does not support them it users can use the template uniform-electrodes currently in Brainstorm and use the Add/Remove contacts feature to edit them as required.
    
**The features and the way to test them are listed as under:**  
- [x] **Merge electrodes (SEEG only)** (commit f5d8906, 652f995, ac77c67)
   - **Testing:**
     - Option-1: Select electrodes in panel iEEG > right click on the electrodes > `Merge Electrodes` 
     - Option-2: Select electrodes in panel iEEG > press `Ctrl+M`
![Screenshot 2025-04-23 181643](https://github.com/user-attachments/assets/85441276-a0cf-4afe-9b2b-2e5bc2c0327e)
   
- [x] **Add contacts (SEEG only)** (commit 1d946a6)
   - **Testing:**
     - Option-1: Open 3DViz from SEEG channel > Add IsoSurface > Select electrode in panel iEEG > Turn on `Select Surface Point` > Select a location on the IsoSurface > click `Contacts` (menu) > `Add contact` in iEEG panel or press shortcut key `S` 
     - Option-2: Open 3DViz of SEEG channel > Add IsoSurface > Select electrode in panel iEEG > Turn on `Select Surface Point` > Select a location on the IsoSurface > Right click (`Channels > Add contact`) or press shortcut key `S`
     - Option-3: Open MRI Viewer from SEEG channel > Select electrode in panel iEEG > Set crosshair at a location in MRI Viewer > click `Contacts` (menu) > `Add contact` in iEEG panel or press shortcut key `S`
     - Option-4: Open MRI Viewer from SEEG channel > Select electrode in panel iEEG > Set crosshair at a location in MRI Viewer > Right click (`Electrodes> Add contact`)  or press shortcut key `S`
       
- [x] **Remove contacts (SEEG only)** (commit d88dbcd)
   - **Testing:**
     - Option-1: Select contact(s) in panel iEEG > press `Delete` or `Backspace`
     - Option-2: Select contact(s) in panel iEEG > click `Contacts` (menu) > `Remove selected contacts`
     - Option-3: Select the contact in 3D figure >  press `Delete` or `Backspace`
     - Option-4: Select the contact in 3D figure > right click (`Channels > Remove contact`)

- Panel iEEG
![Screenshot 2025-04-21 184412](https://github.com/user-attachments/assets/577a041a-5849-4c08-960d-d63c651efda3)
- 3D figure
![Screenshot 2025-04-21 184513](https://github.com/user-attachments/assets/1c31146d-e39f-47c2-832a-3730bcd748ac)
 - MRI Viewer
![Screenshot 2025-04-21 184557](https://github.com/user-attachments/assets/0a88b401-be98-46ec-b282-7b0a40121c0e)

- **Addresses # 11 and # 12 in #732** 
>Delete and add contacts while maintaining the ordering

>Regrouping contacts correctly for wrong grouping of contacts for a electrode

Some points for discussion @tmedani @rcassani:
1. I have not added the remove contacts feature from MRI viewer.  Do you think we should have something like a drop-down list approach we have for `Set electrode position` ?
![Screenshot 2025-04-21 175358](https://github.com/user-attachments/assets/3420bd5b-63da-4497-92f0-9dca3062777e)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56b6a02648ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.