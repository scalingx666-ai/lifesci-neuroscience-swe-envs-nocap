# Issue

**Title:** Validate training paths instead of overloading Path.home()

## Description

## Problem

The napari training widget used `Path.home()` as a sentinel for "nothing selected". Three inputs were compared against it to decide whether the user had actually chosen a model, a weights file, or YAML files:

```python
trained_model = None if trained_model == Path.home() else trained_model
model_weights = None if model_weights == Path.home() else model_weights
...
if yaml_files[0] == Path.home():
    show_info("Please select a YAML file for training")
```

`output_directory` shared the same `Path.home()` default but was never compared against it, so nothing stopped a run from starting with it. Selecting YAML files and clicking Run without touching Output directory dispatched training with `output_directory=PosixPath('/home/<user>')`, writing checkpoints, tensorboard logs and the trained model into the user's home directory.

The sentinel had two smaller consequences: only `yaml_files[0]` was checked, so nothing validated the rest of a multi-file selection, and a model path that genuinely resolved to the home directory would have been silently reinterpreted as "unset".

## Background

#337 asked for the plugin's inputs to be split into structs "each with their validator", after a bad model file in brainglobe/cellfinder-napari#43 only failed once detection had already run. `InputContainer` is those structs, but the validator half was never built, which is why this widget compares against a sentinel path instead.

## Change

**`cellfinder/napari/train/train_containers.py`** — the four training paths default to `None` instead of `Path.home()`, and `TrainingDataInputs` validates its own fields:

```python
def validation_error(self) -> Optional[str]:
    """Returns why these inputs can't be trained on, if they can't."""
    if not self.yaml_files:
        return "Please select a YAML file for training"

    for yaml_file in map(Path, self.yaml_files):
        if yaml_file.suffix != ".yaml":
            return f"Not a YAML file: {yaml_file.name}"
        if not yaml_file.is_file():
            return f"YAML file does not exist: {yaml_file}"

    if self.output_directory is None:
        return "Please select an output directory"
    if not Path(self.output_directory).is_dir():
        return f"Output directory does not exist: {self.output_directory}"

    return None
```

**`cellfinder/napari/train/train.py`** — both sentinel comparisons and the `yaml_files[0]` guard are gone; the widget asks the container and shows the reason on screen, as #337 asked for:

```python
training_data_inputs = TrainingDataInputs(yaml_files, output_directory)

validation_error = training_data_inputs.validation_error()
if validation_error is not None:
    show_info(validation_error)
    return
```

Training's inputs are all `TrainingDataInputs` fields, so validation lives on the container. The detection widget keeps its checks inline for now, because most of them concern napari layers rather than container fields; only its `trained_model` check would move.

`yaml_files` and `output_directory` are also annotated `Optional[Path]` in the `@magicgui` signature: that annotation, not the dataclass field, is what makes a `FileEdit` nullable, and without it `set_value(None)` raises when the reset button fires.

**`cellfinder/napari/detect/detect_containers.py`** — `ClassificationInputs.trained_model` defaulted to `Path.home()` too. It was already cosmetic, since `as_core_arguments` forces `None` unless a custom model is selected, but it is the last sentinel and is now `None`.

**`cellfinder/napari/input_container.py`** — both widgets restored defaults by skipping any field whose default was `None`. That guard stood in for "this field isn't really a widget", protecting the image-layer selections, and it breaks once the path fields legitimately default to `None`. The containers already declare which fields are widgets, so the base class answers the question directly:

```python
@classmethod
def widget_defaults(cls) -> dict:
    """Returns default values of the fields shown as widgets.

    Fields the class does not represent as a widget, such as layer
    selections, have no default to restore.
    """
    defaults = cls.defaults()
    return {
        name: defaults[name]
        for name in cls.widget_representation()
        if name in defaults
    }
```

`restore_defaults` and `restore_options_defaults` now call it and assign unconditionally, so a future non-widget field needs no guard.

After this, `Path.home()` appears once in the codebase, in `DEFAULT_CELLFINDER_DIRECTORY`, which is a genuine home-directory use.

## Behaviour change

A training run that previously started with the default output directory now stops and asks for one. Non-existent YAML files are also rejected at the widget rather than failing later inside `train_yaml`.

## Verification

The bug was reproduced against `main` before the fix by driving the real widget through the napari fixture. With YAML files selected and the output directory untouched, `run_training` was called with

```
TrainingDataInputs(yaml_files=(PosixPath('.../training.yaml'),),
                   output_directory=PosixPath('/home/<user>'))
```

After the change the same sequence shows "Please select an output directory" and `run_training` is not called.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e14fcaa752e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.