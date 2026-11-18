# Issue

**Title:** Update panel ieeg: Add SEEG manual contact localization capabilities

## Description

# SEEG manual contact localization

## Description

Extend the capabilities to perform SEEG electrode and contact location. In previous versions, SEEG localization was performed from the the MRI Viewer. With this PR localization can be done from but now this can be done from the thresholded 3D isosurface as well using the panel_coordinates which gives a much detailed level of accuracy of setting the points. The `isosurface` is generated from a CT scan that has been registered to the subject anatomy (MRI). See: #684.

## TODOs
* A way to change the threshold for isosurface without creating a file at every update. See 

* If implantation started from the anatomy view, even if the Subject is using a channel file for each study, the implantation process should prompt to the creation of a channel file at `@intra` folder

---

## How to use

**[THESE ARE USED AS TEST DATA BELOW](https://drive.google.com/drive/folders/1TI8wANAb09erddYP52bXyXo5xuajLCNf?usp=sharing)**

Steps:
1. Load the CT and generate isoSurface as per the steps in 
2. Close all figure windows using the **X** button on the top right of the BST GUI making sure the cache is clear
3. Right click on the CT and click on **ECOG/SEEG implantation**
4. It opens the functional tab with the MRI with CT overlay loaded as one figure and the isoSurface with 3rd MRI view another figure. It also opens the **[panel_ieeg](https://neuroimage.usc.edu/brainstorm/Tutorials/Epileptogenicity#Panel_iEEG)** tab. 
![Screenshot 2024-03-04 185705](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/b9904995-047a-47dd-8377-6cb00283cd06)
5. Click the **+** icon from the Panel menu and add **panel_coordinates** as it will be used later.


**Updates in the Panel iEEG features and functionalities:**
1. Earlier user could set the tip and entry using just the MRI Viewer, but now this can be done from the 3D Viz's thresholded isosurface as well using the panel_coordinates which gives a much detailed level of accuracy of setting the points. 
- STEPS:
a. Make sure the MRI Viewer is the active window, **Add an electrode** using the **+** sign.
b. Choose the **Model** from the bottom drop down list in the panel as required (can use **PMT 2102-16-091/2102-16-101**) for now.
c. Go to the **Coordinates** tab, click **Select** and choose the point in the iso surface which is going to be set as the tip. This should plot a yellow crosshair marker point on the blob. At the bottom in **Panel iEEG** click **Set tip** and the button turns green indicating the tip been set. **This point in 3D is at the centroid of the blob which gives a more accurate location of the contact**.
d. Go to the **Coordinates** tab again, click **Select** and choose the point in the iso surface which is going to be set as the entry point. This should plot a yellow crosshair marker point on the blob. At the bottom in **Panel iEEG**, click **Set skull entry** and the button turns green indicating the entry been set.
e. The MRI Viewer gets updated with the an aligned electrode.
f. Click on **Contacts: Save Modifications**. And then double click the **SEEG/ECOG()** channel under **Implantation** node to update the 3DViz.

2. List of contacts added right next to the electrode list. Once a user click on the electrode it shows the list of contacts user to browse through.

3. Clicking on the contact in the list highlights the location on the MRI Viewer by taking the cross-hair there.

4. Clicking on the contact in 3D Viz highlights the  contact and electrode in Panel which in turn performs steps as in 3. above

5. Line fitting through the points by doing **Contacts: Line fit through contacts** is also added. This is helpful if suppose the user fine tunes the contacts by updating their location either by choosing the desired point in isosurface using the coordinates panel or directly choosing a point in MRI Viewer and then **Right clicking on the MRI Viewer, Electrodes: Set Electrode position**. If the user then clicks **Contacts: Line fit through contacts** this shows a rough trajectory of the actual path. **THIS WILL BE REPLACED BY SPLINE FITTING LATER**.

**Update in the panel_surface**
Once we have a isosurface with us, the **Thresh** slider is added for regeneration of isoSurface based on the new isoValue set by the slider. This aids for localizing contacts much better by giving user more control and precision for getting accurate contacts. Also made sure that this slider is active only for isoSurface and for no other surface.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2faeda3ff35`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.