# Issue

**Title:** Add types to layer-from-json

## Description

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![A GIF or MEME to give some spice of the internet](https://user-images.githubusercontent.com/23236940/95750055-e157ef00-0c9c-11eb-8d62-c40482536c68.png)

## Description
<!--- Describe your changes in detail -->
I changed the `layer-from-json.js` file to a TypeScript file. This change required a different access of a property from both layer and `jsonLayer` object so I used a `get()` method from the lodash library (I had to add lodash types in package.json to use it). I did not change the structure of a function and this enabled its use in feed-forward.ts file properly. There is `any` used once as `Reflect.construct()` returns this type. In feed-forward.ts `getLayer()` is still not prepared to receive a `null` value returned from the `layerFromJSON()` function and in my opinion it is up to the maintainers what to do with this case.


## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->



## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->
I ran `npm run test` before and after my changes. 13 test failed on Windows before and after my changes and in the files not connected to this function.

The most common fail was of this type:
`deltasRows = deltasRows ?? weightRows;
                                     ^
    SyntaxError: Unexpected token '?'`

## Screenshots (if appropriate):

I tried to add a unit test for this function but jest.config is still not properly set for all types of .ts files or even plain .js files that import .ts modules. Here is an error: 

![broken-jest-config-for-typescript](https://user-images.githubusercontent.com/23236940/95755236-73afc100-0ca4-11eb-873d-d073fbee7856.png)

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] My code focuses on the main motivation and avoids scope creep.
- [x] My code passes current tests and adds new tests where possible.
- [x] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [x] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb2ec0f2441e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.