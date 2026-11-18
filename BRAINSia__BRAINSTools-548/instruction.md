# Issue

**Title:** add github pritems

## Description

- **ENH: Change cmake support ranges**
- **ENH: Update VTK to 9.5**
- **COMP: Update ITKv5 Git tag to release-5.4**
- **STYLE: Remove commented out code from 2016.**
- **COMP: Fix missing shebang chmod mismatch**
- **ENH: Adding precommit and .clang-format sync with ITK.**
- **ENH: Add initial .clang-tidy file for BRAINSTools**
- **STYLE: Apply clang-tidy rule performance-unnecessary-value-param**
- **STYLE: Apply clang-tidy rule performance-enum-size**
- **STYLE: Apply clang-tidy rule performance-faster-string-find**
- **STYLE: Apply clang-tidy rule performance-for-range-copy**
- **STYLE: Apply clang-tidy rule performance-implicit-conversion-in-loop**
- **STYLE: Apply clang-tidy rule performance-inefficient-algorithm**
- **STYLE: Apply clang-tidy rule performance-inefficient-string-concatenation**
- **STYLE: Apply clang-tidy rule performance-inefficient-vector-operation**
- **STYLE: Apply clang-tidy rule performance-move-const-arg**
- **STYLE: Apply clang-tidy rule performance-noexcept-destructor**
- **STYLE: Apply clang-tidy rule performance-noexcept-move-constructor**
- **STYLE: Apply clang-tidy rule performance-noexcept-swap**
- **STYLE: Apply clang-tidy rule performance-trivially-destructible**
- **STYLE: Apply clang-tidy rule performance-type-promotion-in-math-fn**
- **STYLE: Apply clang-tidy rule performance-unnecessary-copy-initialization**
- **STYLE: Apply clang-tidy rule modernize-deprecated-headers**
- **STYLE: Apply clang-tidy rule modernize-pass-by-value**
- **STYLE: Apply clang-tidy rule modernize-return-braced-init-list**
- **STYLE: Apply clang-tidy rule modernize-type-traits**
- **STYLE: Apply clang-tidy rule modernize-use-bool-literals**
- **STYLE: Apply clang-tidy rule modernize-use-nullptr**
- **STYLE: Apply clang-tidy rule modernize-use-using**
- **STYLE: Apply clang-tidy rule modernize-use-auto**
- **STYLE: Apply clang-tidy rule modernize-use-override**
- **STYLE: Apply clang-tidy rule modernize-use-equals-default**
- **STYLE: Apply clang-tidy rule modernize-use-equals-delete**
- **STYLE: Apply clang-tidy rule modernize-use-nodiscard**
- **STYLE: Apply clang-tidy rule modernize-use-noexcept**
- **STYLE: Apply clang-tidy rule modernize-avoid-bind**
- **STYLE: Apply clang-tidy rule modernize-concat-nested-namespaces**
- **STYLE: Apply clang-tidy rule modernize-deprecated-ios-base-aliases**
- **STYLE: Apply clang-tidy rule modernize-loop-convert**
- **STYLE: Apply clang-tidy rule modernize-macro-to-enum**
- **STYLE: Apply clang-tidy rule modernize-make-shared**
- **STYLE: Apply clang-tidy rule modernize-min-max-use-initializer-list**
- **STYLE: Apply clang-tidy rule modernize-raw-string-literal**
- **STYLE: Apply clang-tidy rule modernize-redundant-void-arg**
- **STYLE: Apply clang-tidy rule modernize-replace-auto-ptr**
- **STYLE: Apply clang-tidy rule modernize-replace-disallow-copy-and-assign-macro**
- **STYLE: Apply clang-tidy rule modernize-replace-random-shuffle**
- **STYLE: Apply clang-tidy rule modernize-shrink-to-fit**
- **STYLE: Apply clang-tidy rule modernize-unary-static-assert**
- **STYLE: Apply clang-tidy rule modernize-use-constraints**
- **STYLE: Apply clang-tidy rule modernize-use-default-member-init**
- **STYLE: Apply clang-tidy rule modernize-use-designated-initializers**
- **STYLE: Apply clang-tidy rule modernize-use-emplace**
- **STYLE: Apply clang-tidy rule modernize-use-integer-sign-comparison**
- **STYLE: Apply clang-tidy rule modernize-use-ranges**
- **STYLE: Apply clang-tidy rule modernize-use-starts-ends-with**
- **STYLE: Apply clang-tidy rule modernize-use-std-format**
- **STYLE: Apply clang-tidy rule modernize-use-std-numbers**
- **STYLE: Apply clang-tidy rule modernize-use-std-print**
- **STYLE: Apply clang-tidy rule modernize-use-uncaught-exceptions**
- **STYLE: Apply clang-tidy rule modernize-avoid-c-arrays**
- **STYLE: Apply clang-tidy rule bugprone-incorrect-roundings**
- **STYLE: Apply clang-tidy rule cppcoreguidelines-init-variables**
- **STYLE: Apply clang-tidy rule cppcoreguidelines-prefer-member-initializer**
- **STYLE: Apply clang-tidy rule cppcoreguidelines-pro-bounds-constant-array-index**
- **STYLE: Apply clang-tidy rule cppcoreguidelines-misleading-capture-default-by-value**
- **STYLE: Apply clang-tidy rule readability-container-size-empty**
- **STYLE: Apply clang-tidy rule readability-make-member-function-const**
- **COMP: Prevent clang-tidy over-constification.**
- **STYLE: Remove unused type aliases to improve code readability**
- **COMP: Update coordinate orientation mechanism in `itkIO.h`**
- **ENH: Adding script for updating github labels.**

See the [CONTRIBUTING](CONTRIBUTING.md) guide. Specifically:

Start BRAINSTools commit messages with a standard prefix (and a space):

 * BUG: fix for runtime crash or incorrect result
 * COMP: compiler error or warning fix
 * DOC: documentation change
 * ENH: new functionality
 * PERF: performance improvement
 * STYLE: no logic impact (indentation, comments)
 * WIP: Work In Progress not ready for merge

Provide a short, meaningful message that describes the change you made.

When the Pull Request (PR) is based on a single commit, the commit message is usually left as the PR message.

A [reference to a related issue or pull request](https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests) in your repository. You can automatically [close a related issues using keywords](https://help.github.com/articles/closing-issues-using-keywords/)

[@mentions](https://help.github.com/articles/basic-writing-and-formatting-syntax/#mentioning-people-and-teams) of the person or team responsible for reviewing proposed changes.

Thanks for contributing to BRAINSTools!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d9e623c6c6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.