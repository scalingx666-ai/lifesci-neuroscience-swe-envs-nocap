# Issue

**Title:** Add HED tags to eeg_matchingpennies dataset

## Description

The eeg_matchingpennies dataset cannot be very well re-used for several reasons:

- there are only 10 EEG electrodes recorded
- very few events were recorded
- ...

**However** it can still serve as a valuable example to showcase some BIDS principles.

That's why I want to add HED tags to it. I took a draft from @VisLab that she sent to me via email some months ago.

To use an HED tagging strategy, I re-formatted the dataset to some extend ... so that it uses a "trial based" events.tsv file again --> each row in events.tsv represents a trial, which contains several events.

What I am stuck at is how to format the brackets in the HED tags. This is the relevant part, I added linebreaks into the HED strings for readability:

```json
"trial_type": {
    "Description": "Which hand was raised, and did this match the BCIs prediction (lose outcome), or not (win outcome).",
    "Levels": {
        "raised-left/match-false": "raised left hand, bci predicted right hand",
        "raised-left/match-true": "raised left hand, bci predicted left hand",
        "raised-right/match-false": "raised right hand, bci predicted left hand",
        "raised-right/match-true": "raised right hand, bci predicted right hand"
    },
    "HED": {
        "raised-left/match-true": "Description/Subject raised left hand and computer presented image of left hand,
(Agent-action, Experiment-subject, (Lift, (Left-side, Hand), (Release, (Left-side, Button)), ((Delay/68 ms, Approximated),
(Sensory-presentation, Visual, (Drawing, ID/left_hand.png, (Left-side, Hand), (Feedback, (Intended-effect, Penalty)))",

        "raised-left/match-false": "Description/Subject raised left hand and computer presented image of right hand,
(Agent-action, Experiment-subject, (Lift, (Left-side, Hand), (Release, (Left-side, Button)), ((Delay/68 ms, Approximated),
(Sensory-presentation, Visual, (Drawing, ID/right_hand.png, (Right-side, Hand), (Feedback, (Intended-effect, Reward)))",

        "raised-right/match-true": "Description/Subject raised right hand and computer presented image of right hand,
(Agent-action, Experiment-subject, (Lift, (Right-side, Hand), (Release, (Right-side, Button)), ((Delay/68 ms, Approximated),
(Sensory-presentation, Visual, (Drawing, ID/right_hand.png, (Right-side, Hand), (Feedback, (Intended-effect, Penalty)))",

        "raised-right/match-false": "Description/Subject raised right hand and computer presented image of left hand,
(Agent-action, Experiment-subject, (Lift, (Right-side, Hand), (Release, (Right-side, Button)), ((Delay/68 ms, Approximated),
(Sensory-presentation, Visual, (Drawing, ID/left_hand.png, (Left-side, Hand), (Feedback, (Intended-effect, Reward)))"
    }
}
```

The HED validator rightfully raises an issue that more brackets are opened than are closed. I wanted to fix this, but I am not really sure where to start learning about how to do this. Can you help @VisLab?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `578dcfebbd08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.