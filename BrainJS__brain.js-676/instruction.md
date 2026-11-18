# Issue

**Title:** Refactor cross-validation.js into typescript

## Description

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![EkrVTdKWkAEjQ7K](https://user-images.githubusercontent.com/35373228/102969044-dc3bcb00-44a9-11eb-8853-09a33c0c29fa.png)

(i had recently learned about fast gradient attacks)

## Description
<!--- Describe your changes in detail -->
Short description: Typescripted :)

Long description:

Much of the code was adding return types, parameter types, some generics with e.g. shuffleArray, and copying the typed definitions from index.d.ts and making some modifications to fix them since some fields were missing and binary results were not handled. Also added comments to places where I made type assertions due to `neural-networks.js` not being typed yet.

The following are some important notes / changes that I think should be made aware of

1. Refactored tests to handle new typings, all tests are effectively still the same but when creating the new CrossValidation class it works a little differently. e.g. previously we passed in a function `run` as the network options but this is now passed in as a field to the network options because we love typings (I also added a [x: string]: any type to `INeuralNetworkOptions`, from the code it appears that this might be wanted but wasn't in the original index.d.ts)

2. Added 3 typeguards, which for now are static functions of `CrossValidation`. These check if the partition results are binary or not, if the stats are binary or not, and if the return value of CrossValidation's train function is binary results or not. This is also used in the tests a bit where I added a failure condition for checking if 1. the guard works, and 2. the results returned should contain binary result relevant information e.g. truePos, trueNeg, recall etc. This is specifically used in the `.train()` function to tell typescript what kind of results and stats we have

3. ICrossValidateStats appears to be incorrrectly typed in index.d.ts and it has been changed based on what I saw the code return originally in the .train() function. Moreover, it looks like ICrossValidateJSON is the same as ICrossValidateStats so I set them as the same type for now.

4. To deal with the missing typings for neural-network.js, I pulled the types from index.d.ts and put them in a temporary `neural-network-types.ts` file for use until the .js file is converted to .ts

5. There were some `for in` loops in https://github.com/BrainJS/brain.js/blob/15f061bae6c0b1c7863d2db68f37a907dcbbb071/src/cross-validate.js#L140-L144 and some of the lines after that I think were bugs because we loop over properties of `avgs` and then check if the property is in `avgs` which is always truthy. I think this is meant to be looping over properties of `avgs` and then check if the same property is in `result`. Regardless, I unrolled those loops because typescript didn't understand them correctly and fixed the above bug by accumulating properties shared between `avgs` and `result` as defined by their typings from `index.d.ts` and any other fixes made in the previous points mentioned. Same was applied to the 2 other `for in` loops

6. Made CrossValidation's property `json` of type `ICrossValidateJSON | null` since we initially set it to `null` although I think it should be `undefined` but have left it as it was. This then means I fixed `toNeuralNetwork()` function to check if `this.json` is null first before returning the neural network from the json, with the following error message if check fails:
'CV json is null, you must call .train() first before getting the neural network'

7. We used to have that the `.train()` function accepted a data argument of type other than an array as seen here: https://github.com/BrainJS/brain.js/blob/15f061bae6c0b1c7863d2db68f37a907dcbbb071/src/cross-validate.js#L90-L93
I feel that this is a bug because if the data is not an array, then we set it to equal an object with randomized property key-value pairings in line 94 with the shuffle array applied on the object keys of data. Then here: https://github.com/BrainJS/brain.js/blob/15f061bae6c0b1c7863d2db68f37a907dcbbb071/src/cross-validate.js#L123-L125, we call `slice` on data, which would fail if data is not an array. Thus, I forced the data argument to be of type array and removed the now unnecessary check of whether it is an array or not.

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->


## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->

All of the original tests were effectively kept the same in the minor typing refactor for the associated test file. All of the same tests that originally passed still pass (the one that never passed originally was the RNN one)

## Screenshots (if appropriate):

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [x] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] My code focuses on the main motivation and avoids scope creep.
- [x] My code passes current tests and adds new tests where possible.
- [x] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself). (if it's not, then the original code didn't follow this probably 🙃)
- [x] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.


## Extra notes

Not important right now for the typescript migration, just small suggestions I thought of as I refactored

1. calling train on a network and cross validation object takes data first, then options. the `testPartition` function takes options first then the data arguments, which I found a bit odd? Almost had a bug because of it
2. I think we should rename some of the type names, they're a little confusing and since we have the binary or not distinction, is slightly overwhelming
3. Also should we comment the functions? I see we have some of them but I recommend comments being a future milestone

Let me know if anything is broken or any suggestions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15f061bae6c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.