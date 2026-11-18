# Issue

**Title:** Fix raster plot handling of segment times where `t_start` is not zero.

## Description

This PR updates the raster widgets which was not handling `t_start`, and also patches the associated `get_segment_durations` function similarly.

The previous implementation calculated spike times using the sample index and sampling frequency, but not incorporating `t_start`. Similarly created durations for each segment, and used these in raster plots for things like drawing vertical lines betwen segments.

This PR fixes by using the newer time-getting machinery for spike times, and replacing `durations` with a dictionary of start-stop times (tuples) per segment called `segment_start_stop_times`. The reason it's a dictionary not a list is because the segments to display can be sub-selected, and if these are not referred to explicitly it gets complicated as the segments are re-indexed in BaseRasterWidget. `durations` is just removed, I assume that's okay as was only used internally.

Now `get_segment_durations` also returns this `segment_start_stop_times`. Two things are a bit weird with this fuction, one the name is now not great because it returns two things. **This has now been updated to check to see if the sorting has a recording, and if so get the start/stop times directly**.

In the plots below you can see the original issue / fix - in this example the recording has three segments each 10 seconds long starting at [5.0, 25, 50]. The raster plot however all start at `t=0` and the segment boundaries are not correct (note motion plot only takes 1 segment).

**Before**
<img width="457" height="356" alt="image" src="https://github.com/user-attachments/assets/b85402bc-7ea9-437d-9763-f06250b1a7c5" />

<img width="611" height="474" alt="image" src="https://github.com/user-attachments/assets/a277253c-928b-4835-800b-0f5837a257a0" /> 

<img width="568" height="447" alt="image" src="https://github.com/user-attachments/assets/af7d537b-300c-4206-bc89-27863d6d2390" />

**After** (images updated after change to axticklabels)

<img width="1051" height="792" alt="image" src="https://github.com/user-attachments/assets/86a4527b-8a0c-444c-9971-404d57d2b0e8" />

<img width="612" height="470" alt="image" src="https://github.com/user-attachments/assets/ae65f102-0302-4a13-b74e-3cc33167ad91" /> 

<img width="1311" height="1016" alt="image" src="https://github.com/user-attachments/assets/d2b2a3c6-4d73-4d19-9ff6-cfb0700fc637" />

Code to produce plots below, note that the amplitude plots will not generate as show, as needs #4796 

<details><summary> Test code </summary> 

```
"""
Generate a multi-segment recording whose segments start at non-zero times,
then plot a raster and motion-correction diagnostics.
"""

import matplotlib.pyplot as plt

import spikeinterface.widgets as sw
from spikeinterface.core import (
    append_recordings,
    append_sortings,
    create_sorting_analyzer,
    generate_ground_truth_recording,
)
from spikeinterface.preprocessing import correct_motion

# When False,  the times are inferred from the spike vector for amplitudes 
# and raster widget (motion info plot requires the recording)
WITH_RECORDING = True


def make_multi_segment_recording(num_segments=3, seed=2205):
    """Build a multi-segment recording and sorting with non-zero segment start times."""

    common_kwargs = dict(
        durations=[10.0],
        sampling_frequency=30000.0,
        num_channels=64,
        num_units=60,
    )

    recordings = []
    sortings = []
    # Offsets so segments do NOT start at time zero.
    start_time_offsets = [5.0, 25, 50]

    for seg in range(num_segments):
        recording, sorting = generate_ground_truth_recording(seed=seed + seg, **common_kwargs)
        # Give this segment a non-zero start time.
        recording.shift_times(shift=start_time_offsets[seg % len(start_time_offsets)])
        recordings.append(recording)
        sortings.append(sorting)

    multi_segment_recording = append_recordings(recordings)
    multi_segment_sorting = append_sortings(sortings)
    return multi_segment_recording, multi_segment_sorting, recordings[0]


def main():
    recording, sorting, motion_recording = make_multi_segment_recording()
    if WITH_RECORDING:
        sorting.register_recording(recording)

    if WITH_RECORDING:
        for seg in range(recording.get_num_segments()):
            print(f"  segment {seg}: start={recording.get_start_time(seg):.1f}s end={recording.get_end_time(seg):.1f}s")

    # Plot a raster of all segments.
    segment_indices = list(range(sorting.get_num_segments()))
    sw.plot_rasters(sorting, segment_indices=segment_indices)

    sorting_analyzer = create_sorting_analyzer(sorting, recording, format="memory")
    sorting_analyzer.compute("random_spikes")
    sorting_analyzer.compute("waveforms")
    sorting_analyzer.compute("templates")
    sorting_analyzer.compute("spike_amplitudes")
    sw.plot_amplitudes(
        sorting_analyzer,
        segment_indices=segment_indices,
        plot_histograms=True,
        plot_legend=False,
    )

    _, motion_info = correct_motion(
        motion_recording,
        preset="kilosort_like",
        output_motion_info=True,
        n_jobs=1,
    )
    sw.plot_motion_info(motion_info, recording=motion_recording, motion_lim=1.0)

    plt.show()


if __name__ == "__main__":
    main()

```


</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25ebb0cfc9ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.