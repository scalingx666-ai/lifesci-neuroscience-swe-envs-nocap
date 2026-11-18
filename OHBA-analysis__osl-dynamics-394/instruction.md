# Issue

**Title:** Restore and update callbacks after TensorFlow upgrade

## Description

This PR restores and updates several callbacks that were inadvertently dropped during the TensorFlow version upgrade. It fixes related bugs and modernises the callback implementations to align with current Keras/TensorFlow behaviour. It also introduces a new callback.

**Callback improvements:**

* `SaveBestCallback`
    - Activates saving only after a user-specified epoch threshold.
    - Resets the monitored metric (self.best) upon activation to ensure correct comparison against earlier epochs.
    - Removes deprecated internal attributes such as self.epochs_since_last_save, aligning with updated Keras internals.
    - Adds more transparent activation logic and logging.

* `SummaryStatsCallback`
    - Introduces a callback that computes and stores summary statistics at the end of each epoch.
    - This is useful for diagnosing convergence behaviour, monitoring model stability, and identifying potential overfitting.
    - Example usage:
        ```python
        # Build model
        model = Model(config)
        
        # Define callbacks
        cb = callbacks.SummaryStatsCallback(
            prediction_dataset, model, sampling_frequency
        )
        model.fit(
            training_dataset, epochs=n_epochs, callbacks=[cb],
        )
        
        # Get epoch-wise summary statistics
        summary_stats = cb.summary_stats
        ```

* `DiceCoefficientCallback`
    - Improved handling of model prediction outputs to support multiple output structures for TF update compatibility.

* Weight file naming consistency
    - Updated model weight paths to use the `.weights.h5` suffix when using `SaveBestCallback`.
    - This ensures compatibility with the newer `tf.keras.callbacks.ModelCheckpoint`, which distinguishes weight files from full SavedModels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db124a0a6cae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.