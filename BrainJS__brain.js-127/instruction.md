# Issue

**Title:** Fix multiple run issue

## Description

If you run a NeuralNet (CPU or GPU) multiple times, with various inputs, then check the results after all the runs, the values will all be the same. e.g.
```js
const resultA = trainedNet.run([0,1,0]); // should be [0]
const resultB = trainedNet.run([1,0,1]); // should be [0.5]
const resultC = trainedNet.run([0,1,1]); // should be [1]

console.log(resultA, resultB, resultC) // [1], [1], [1]
```
This PR prevents this behavior by cloning the output layer's values in `runInput` rather than simply returning the output layer. The previous implementation (I believe) was breaking things because of object sharing.

Also, this standardizes the outputs of `run` for both `NeuralNetGPU` and `NeuralNet` to be an nontyped array. Previously GPU would return a texture, and CPU would return a typed array. This part was just out of simplicity from using the spread operator, rather than explicitly tying the result of `runInput` to a type.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b057d4c24239`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.