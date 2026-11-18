# Issue

**Title:** Add comment to interface for convenience.

## Description

## Added comments to type definition for Typescript for convenience.

## Description
Here is the part I changed.

* Comments are from `README.md`. So, if there is any incorrect information on README.md, this comments also must be incorrect.

```ts
export interface INeuralNetworkTrainingOptions {
  /**
   * the maximum times to iterate the training data --> number greater than 0
   * @default 20000
   */
  iterations?: number;

  /**
   * the acceptable error percentage from training data --> number between 0 and 1
   * @default 0.005
   */
  errorThresh?: number;

  /**
   * true to use console.log, when a function is supplied it is used --> Either true or a function
   * @default false
   */
  log?: boolean | INeuralNetworkTrainingCallback;

  /**
   * iterations between logging out --> number greater than 0
   * @default 10
   */
  logPeriod?: number;

  /**
   * scales with delta to effect training rate --> number between 0 and 1
   * @default 0.3
   */
  learningRate?: number;

  /**
   * scales with next layer's change value --> number between 0 and 1
   * @default 0.1
   */
  momentum?: number;

  /**
   * a periodic call back that can be triggered while training --> null or function
   * @default null
   */
  callback?: INeuralNetworkTrainingCallback | number;

  /**
   * the number of iterations through the training data between callback calls --> number greater than 0
   * @default 10
   */
  callbackPeriod?: number;

  /**
   * the max number of milliseconds to train for --> number greater than 0
   * @default Infinity
   */
  timeout?: number;
  praxis?: null | 'adam'
}
```

## Motivation and Context
Because brain.js is awesome.

## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->

## Screenshots (if appropriate):

## Types of changes
**NO CHANGE**

## Author's Checklist:
- [ ] My code focuses on the main motivation and avoids scope creep.
- [ ] My code passes current tests and adds new tests where possible.
- [ ] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [x] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8455336e2742`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.