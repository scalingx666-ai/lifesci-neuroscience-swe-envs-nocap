# Issue

**Title:** A very simple heuristic player

## Description

tl;dr I "hacked" the task with a simple heuristic. I may try the same with the next task, too.

Expected score: 13.5

I began with the idea of building a network inspired by the fly’s compass system---a ring attractor network that tracks heading direction (cf. https://doi.org/10.1038/s41593-024-01766-5). The compass was planned to integrate distance sensor data during movement, allowing me to construct an allocentric representation that could then interface with a memory module.

While developing this network, I realized that the multiple processing stages required (at minimum: recurrent excitatory and inhibitory components + recurrently connected shifter populations) paired with the inherent delays of continuous-time neurons (with stable, i.e., slow dynamics) would introduce significant lag in steering. (Compensating for that lag would have required an additional cerebellum-like forward model. In a way, this provided a nice exposition of the kinds of problems faced by Evolution.)

When refactoring my first draft, I noticed that you shouldn't take the full sensory input for immediate steering decisions, since you only need to avoid the wall closest to you. Further, only the left- and rightmost distance sensors are necessary for this. So I stripped away all of the complexity and replaced it with an extremely simple heuristic: threshold the outermost sensor inputs and steer away from whichever side reports the closer wall. The result is an agent that only circles the outer lane of the arena. Because the respective network only has two parameters, you can discover a very good agent by random sampling.

At least for me, this raises the question whether such a handcrafted solution will be considered valid for the challenge (I read the challenge as primarily about learning, not handcrafting). Even if it is disregared as a solution, I find it a useful contribution because it (a) may be a useful baseline for more advanced models and (b) shows the "true" complexity of the current task (i.e., how "hackable" it is), and could stimulate a discussion about what counts as handcrafted / (in)valid entry. After all, this solution still respects the challenge’s “no more than 64 constants” rule. I could put a fancy optimizer on top of this network topology, but the found algorithm would basically remain the same.

The original solution I envisioned would have been much more complex and would have required a lot of time for hyperparameter tuning and network design. Would it be a more positive outcome if I built a mini compass system plus hippocampus, cerebellum, and basal ganglia just to solve this simple task? I'd wager a more complex solution probably would generalize to a new unknown problem setting as well as a DeepQ network playing Breakout with reversed colors.

I’m curious to see whether the next task will still be “hackable.” I feel, it's a very tight balance between a solvable---given minimal resources---yet complex task.

*I also built a slightly more complicated heuristic that adapts to the randomly chosen reward position, but since it cannot be effectively optimized via random guessing and it seems to be completely missing the point of the challenge, I omit it here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bac519c5a589`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.