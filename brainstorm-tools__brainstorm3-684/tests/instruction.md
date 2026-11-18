# Issue

**Title:** CT integration and Generation of thresholded mesh from CT

## Description

# CT integration

This PR adds: 
* New node type `'volct'` for CT data, icon and tooltip (It requires `brainstorm.jar` from [here](https://github.com/rcassani/bst-java/blob/add-ct/brainstorm/dist/brainstorm.jar))

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/9fc3c7ef-dfc9-4781-8cfa-27ad76aca2fa)

* Updated popup menu in the database tree for `'volct'`
    * MRI-exclusive actions are removed
    * Do not allow to be Subject's default MRI
    * Do not allow editing MRI form CT

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/d91ddefa-7130-4b40-9d2a-fffdacee42ca)

* Example of updating a process to handle MRI and CT: `process_mri_deface.m`
![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/c1225a35-3546-4639-b62e-909d4818713d)


# Generation of thresholded mesh from CT
**[THESE ARE USED AS TEST DATA BELOW](https://drive.google.com/drive/folders/1TI8wANAb09erddYP52bXyXo5xuajLCNf?usp=sharing)**

**NOTE: This is just a CT specific feature**

1. Assuming we have a CT by following [Import CT](https://neuroimage.usc.edu/brainstorm/Tutorials/ImportAnatomy#Import_CT)


2. Right-click on the **CT → MRI segmentation → Generate mesh from CT** . 
<img src="https://github.com/brainstorm-tools/brainstorm3/assets/21283733/d720129c-4bc0-44b7-95a4-e65040b4778b"  width="500" />


3. This will bring the **Generate isosurface** window. This window shows 3 things in the Hounsfield Unit, the Background level, the White level and the Set isoValue fields. The first and second values are calculated automatically from the histogram of the CT. This is to help the user to decide on what to set the isoValue for getting a good thresholded mesh. Another way is to refer to this https://en.wikipedia.org/wiki/Hounsfield_scale. The best way, however is to just open the CT in the MRI viewer browse through the electrode intensities and do trial and error to get the best value for a clean mesh. In this case, setting the value to **2400** gave a good result. Set the **isoValue** to **2400** and press **OK.** 
<img src="https://github.com/brainstorm-tools/brainstorm3/assets/21283733/516247ef-9780-4ab1-8279-f67b7bf94a98"  width="200" />


4. This will generate a isosurface which looks something like under. **THIS WILL HELP IN DOING SEEG ELECTRODE CONTACT LOCALIZATION**.
<img src="https://github.com/brainstorm-tools/brainstorm3/assets/21283733/54e48822-0a24-4ecf-a88a-1f292b2f7e64"  width="500" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e6e96e7db0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.