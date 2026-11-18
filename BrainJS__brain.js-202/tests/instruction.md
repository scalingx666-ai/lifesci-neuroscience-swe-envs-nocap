# Issue

**Title:** Minor constructor change to make code more consistent

## Description

Diff should explain. Minor change to simplify and make readable the constructor which assigns options or defaults to the instance.

## Requested meme
![A GIF or MEME to give some spice of the internet](https://i.imgur.com/kClg9jr.jpg). As requested.

## Description
The logic which I have replaced by `Object.assign` was convoluted compared to the simple call. In both cases each index of the `default`s is read, and either the `options[index]` or `defaults[index]` is assigned to `this[index]`.

## Motivation and Context
Makes the code a little more consistent (as this pattern is used in other constructors, see [here](https://github.com/BrainJS/brain.js/blob/develop/src/neural-network.js#L63) ). Also reads much more clearly.

## How Has This Been Tested?
```
git clone [...]
cd [...]
npm i
npm run test
#   96 passing (805ms)
#   18 passing (29ms)
node
```
then in `node` (output shown):
```
const brain = require('.');
> var config = {
...     inputSize: 20,
...     inputRange: 20,
...     hiddenSizes:[20,20],
...     outputSize: 20,
...     learningRate: 0.01,
...     decayRate: 0.999,
... }
> var net = new brain.recurrent.RNN(config);
> net.train([{input: [0, 0], output: [0]},
...            {input: [0, 1], output: [1]},
...            {input: [1, 0], output: [1]},
...            {input: [1, 1], output: [0]}]);
{ error: 1.6869640946889366, iterations: 20000 }
> var output = net.run([0, 0]);  // [0]
> output = net.run([0, 1]);  // [1]
'1'
> output = net.run([1, 0]);  // [1]
'1'
> output = net.run([1, 1]);  // [0]
'1'
```

## Types of changes
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [ ] My code focuses on the main motivation and avoids scope creep.
- [x] My code passes current tests and adds new tests where possible.
- [x] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [x] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe5b25f0aa8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.