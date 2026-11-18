# Issue

**Title:** Fix python wrapper config for new forces

## Description

### Changes

This adds args in `config.yaml` to generate python wrappers for the full set of required template instantiations. For example, these instantiations:

```cpp
template class LinearSpringForce<1,1>;
template class LinearSpringForce<1,2>;
template class LinearSpringForce<2,2>;
template class LinearSpringForce<1,3>;
template class LinearSpringForce<2,3>;
template class LinearSpringForce<3,3>;
```

need this additional configuration in `config.yaml`:

```yml
- name: LinearSpringForce
  template_substitutions:
    - signature: <unsigned ELEMENT_DIM, unsigned SPACE_DIM=ELEMENT_DIM>
      replacement: [[1, 1], [1, 2], [2, 2], [1, 3], [2, 3], [3, 3]]
```

This is needed if instantiated templates go beyond the standard cases of `<2,2>`, `<3,3>`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `394d57f87cb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.