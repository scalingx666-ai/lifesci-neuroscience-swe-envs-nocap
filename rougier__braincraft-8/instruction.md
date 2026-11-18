# Issue

**Title:** Sol env01

## Description

## some explanation about the 'switcher' model

I define an "agent" with a subsumption architecture using 3 "behaviors". The agent follows the outer wall turning in an anti-clockwise direction and avoids obstacles too close on its left. When its energy rises up, it is a kind of positive reward signal for the agent that "memorize" it so as to trigger an "early" turn left in the middle corridor. At the end of this "turning left in the middle corridor", the agent silences the reward signal and its memorization.

Oh, and I'm using "ReLu" activation for neurons, easier to work with (on/off) for handcrafting weights.

This "handcrafted" agent could be streamlined, its behavior is not very robust and it sometimes get stuck. But the desired general behavior is there.

### behavior : "away from right"

When input from the rightmost sensors is below a threshold, turn left (positive output).

```python

    # TurnLeft (away from SensorRight)
    W_in[1, i_right] = 1.0
    W_in[1, i_bias] = -0.79
    W_out[0, 1] = 100
```

### behavior : "avoid close things on the left"

Sometimes, the agents comes to close to a left wall, so it avoids it by turning right (negative output when input of the leftmost sensor is above a threshold)

```python

    # TurnRight (avoid close SensorLeft)
    W_in[i_turn+1, i_left] = 1.0
    W_in[i_turn+1, i_bias] = -0.88
    W_out[0, i_turn+1] = -50
```

### behavior : "when rewarded, take the first left"

First, the agents needs to create a "reward" signal, based on it energy variation. Energy variation is computed as inputEnergy(t) - inputEnergy(t-1), and cumulated if positive (being the main motivation for using ReLu activation function). BUT, as the initial difference is high (as the inputEnergy(0-1) is 0), I need to filter out "large" energy bumps.

Then, the reward signal is "memorized" (and slightly amplified) in `X[i_filter+2,0]`, this is a signal for initiating the "turn into the mid corridor".

Not very proud of this part that seems a bit over complicated.

```python
    # detect NRJ increase.
    W_in[i_nrj, i_nrj] = 1.0
    W[i_nrj+1, i_nrj] = 1.0
    W[i_nrj+2, i_nrj] = 1.0
    W[i_nrj+2, i_nrj+1] = - 1.0
    # need a band-filter so as to only detect "small" NRJ bumps
    # (and not the starting bump with value '1')
    W[i_filter, i_nrj+2] = 1.0
    W[i_filter, i_bias]  = -0.004
    W[i_filter+1, i_nrj+2] = 1.0
    # i_filter+2 accumulate and "memorise" reward increase
    W[i_filter+2, i_filter]   = -2.0
    W[i_filter+2, i_filter+1] = 1.0
    W[i_filter+2, i_filter+2] = 1.05
    W[i_filter+2, i_turn_mid+4] = -1000.0  # shut off when end_midturn
    # i_filter+3 is a NOT(i_filter+2)
    W[i_filter+3, i_filter+2] = -1.0
    W[i_filter+3, i_bias] = +0.07
```

To trigger the turn in the middle corridor (only when the reward signal is high enough), the agent kind of detects when the leftmost sensor is low (below threshold) for sometime. Then it turns right until a centerSensor is low enough (meaning the agents faces a far away wall). When "turning into the mid corridor" ends, the agents shuts off the reward accumulation (`X[i_filter+2, 0]`) and the signal that triggered the "mid_turn" (`X[i_turn_mid+1]`).

```python
    # "mid_turn" are started when a far away obstacle on i_left has been seen
    # enough time since some time (hence the * 1.05 feedback on i_turn_mid+1)
    # accumulate i_left < 0.40 when rewarded
    W_in[i_turn_mid, i_left] = -1.0
    W_in[i_turn_mid, i_bias] = 0.45
    W[i_turn_mid, i_filter+3] = -10 # do not detect if no reward received yet
    # accumulate diff
    W[i_turn_mid+1, i_turn_mid] = 1.6
    W[i_turn_mid+1, i_turn_mid+1] = 1.07
    W[i_turn_mid+1, i_turn_mid+4] = -1000  # shut off at end of mid_turn
    # check when to start (threshold i_turn_mid+2)
    W[i_turn_mid+2, i_turn_mid+1] = 1.0
    W[i_turn_mid+2, i_bias] = -1.3

    # when to stop "mid_turn"
    # need to know when NOT(mid_turn)
    W[i_turn_mid+3, i_turn_mid+2] = -1.0
    W_in[i_turn_mid+3, i_bias] = 1.3
    # detect if center_right < 43 AND turning with i_turn_mid+2 (i.e i_turn_mid+2 > 0)
    W_in[i_turn_mid+4, i_center_right] = -1
    W_in[i_turn_mid+4, i_bias] = 0.43
    W[i_turn_mid+4, i_turn_mid+3] = -1   # no while NOT mid_turn

    # finally, apply to output
    W_out[0, i_turn_mid+2] = 100
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `902a0e568131`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.