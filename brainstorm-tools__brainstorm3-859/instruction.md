# Issue

**Title:** Recording acquisition date : save the hour and minute of the recording start

## Description

This is #857 but without the new GUI. 

> 
> Among the todo list of Brainstorm, there is something that is very interesting to me among the (Display (high-priority)(Part SEEG grant) list) :
> 
> > Display time in H:M:S instead of S > If there is t0 in H:M:S instead of S > As an option in Display configuration button>x-axis
> 
> 
> This PR is here to start the process of making this possible. Indeed, for now, we only allow the user to save in brainstorm the date of the data acquisition, but we don't save any information on when the data acquisition started during that day. 
> 
> 
> Here is what the new UI looks like: 
> 
> <img width="372" height="340" alt="image" src="https://github.com/user-attachments/assets/333ed2e3-6094-4920-9e8c-6cc69e38c802" />
> 
> <img width="266" height="236" alt="image" src="https://github.com/user-attachments/assets/a8673186-489d-4f8c-ab64-bdce7799d31a" />
> 
> 
> Few processes will then need to be updated, notably to load the date and time properly when loading / exporting file (i am notably thinking of snirf file and BIDS import/export). I suggest that we first start with this PR; and once merged, i will go and update where needed in the code; after including the display update. 
> 
> 
> 
> 
> Edouard
> 




Proposed GUI: 


<img width="415" height="339" alt="image" src="https://github.com/user-attachments/assets/d63b2ddf-3290-463a-94ad-d2b375304011" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8de32a0f3135`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.