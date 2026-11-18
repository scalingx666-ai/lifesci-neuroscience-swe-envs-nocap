# Issue

**Title:** Updated V4_Miniscope_noise_removal.ipynb

## Description

1.  added "import re" for splitting the strings;
2.  added the code for listing the .avi ain the folder and fine the videos with number in the name; split the names by prefix string and number; find the video with the smallest number as  the first video to process;
3. added a sub folder named "Cleaned" in the folder and save the cleaned videos into the sub folder;
4. changed  to writeFile = cv2.VideoWriter(saveDir + datanamepre + "{:.0f}.avi".format(fileNum),
                            codec, 60, (cols,rows), isColor=False)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c77e5d9c6a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.