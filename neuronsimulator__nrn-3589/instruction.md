# Issue

**Title:** Add NMODL support for multiple INITIAL blocks

## Description

.

The implementation of `MergeInitialBlocksVisitor` basically does the following:

- check if there is > 1 INITIAL block in the AST. If not, do nothing
- add the found INITIAL blocks to a container, `blocks_to_delete`
- iterate over all of the statements in each INITIAL block found (in the order of their appearance in the mod file), and add them to a container, `statements`
- add an additional INITIAL block to the top-level AST, and dump `statements` in it
- delete `blocks_to_delete` from the AST
- if `passes --nmodl-ast` is enabled, write a file `<modfile>.<number>.merge_initial_block.mod`

Some remarks (for future reference):

- `collect_nodes` doesn't actually collect `Node`s, but rather (a vector of) instances of its parent class, `Ast`. This means that we can't directly pass it to `Program`'s `erase_node`. As a workaround, one can use the following idiom (where `is_<some_type>` is one of the methods [here](https://nrn.readthedocs.io/en/latest/doxygen/structnmodl_1_1ast_1_1_ast.html)):

```cpp
auto& blocks = program.get_blocks();
for (const auto& block: blocks) {
   if (block->is_<some_type>()) {
     // logic goes here
  }
}
```

- the `Ast` class doesn't appear to implement `operator==` so we can't compare values at the AST level, but only at the level of NMODL

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `823fb26151df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.