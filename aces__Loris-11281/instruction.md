# Issue

**Title:** [JSX] Add a Field wrapper and move TextareaInput and NumberInput onto it

## Description

## Description

Every element in `jsx/Form.js` draws its own form row, label and error message around its input, each a little differently. So the inputs can't be used outside a form, and there's no one place that decides how a field is laid out.

This adds a `Field` component that owns the row, the label, the required marker and the error message, and moves `TextareaInput` and `NumberInput` onto it as the first two. A control inside a `Field` takes its id, required, disabled and invalid state and the id of its error message from the `Field` through context, so the label points at the input and the input is linked to its message for screen readers. The controls themselves are bare inputs that take a `value`, an `onChange(value)` and any attribute of their native element, forward their ref, and work on their own outside a `Field`.

The `*Element` components keep their props, so the modules don't change. The rest of the elements can follow the same pattern in one PR once this one is agreed.

## Changes
- Added `jsx/form/Field.tsx`, `jsx/form/TextareaInput.tsx` and `jsx/form/NumberInput.tsx`.
- `TextareaElement` and `NumericElement` render their control inside `Field`.
- `InputLabel` takes an `htmlFor`, which `Field` sets to the control's id.
- `TextareaInput` and `NumberInput` take any attribute of their native element and forward their ref.
- `TextareaElement` takes an `errorMessage`, like the other elements.

## Testing Instructions
1. Open the issue tracker's new issue form and the battery manager's add test form.
2. Check the textarea and the number fields look and behave as before: labels, typing, min and max, required.
3. Submit the battery manager form with an invalid age range and check the error shows under the field, with the input's `aria-describedby` pointing at it.

## Related Issues
Related to #11194

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f495c500dec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.