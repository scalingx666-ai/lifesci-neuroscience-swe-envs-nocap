# Issue

**Title:** Add support for multiple prediction outputs + use len() in nb_batches

## Description

Hi @ncullen93,

I'm building an RNN that creates multiple outputs in a single forward pass such as:

```PYTHON
class RnnMultiOutput(nn.Module):

    def forward(self, *c):
        out = [torch.FloatTensor([0, 1]), torch.FloatTensor([1, 0]]
        return out
```

Training of this network works fine but prediction throws an exception at [line](https://github.com/ncullen93/torchsample/blob/master/torchsample/modules/module_trainer.py#L730):

``` PYTHON 
return th.cat(prediction_list,0)
``` 

The problem is that ```th.cat``` expects a list of Tensors, but with a forward pass like above, the output becomes a list (Batch) of a list (Output i) of Tensors.

Maybe there is a better way of doing this? Happy to update the PR if needed.

I've also replaced input[0].size(0) by len(input[0]) as I sometimes use DataLoaders that don't have a size method.

Thanks!

----

1. Add support for multiple outputs in predict and predict_loader methods in ModuleTrainer
2. Prefer len(input[0]) over input[0].size(0) when determining the nb_batches in ModuleTrainer. (Standard PyTorch DataLoaders do not implement size(), but do implement __len__

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abd952b78a51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.