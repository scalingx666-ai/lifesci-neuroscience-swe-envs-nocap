# Issue

**Title:** fix(keyboard): unpack key name and timestamp in event backend

## Description

.

### Problem Description
When using `Keyboard(backend="event")`:
1. `KeyboardDevice.dispatchMessages` queries key events using `event.getKeys(modifiers=False, timeStamped=True)`, which returns a list of `[key_name, timestamp]` pairs (e.g., `[['f', 0.76319]]`).
2. Previously, `dispatchMessages` only accessed `name[0]`, dropping any subsequent keys pressed in the same polling cycle.
3. In `KeyboardDevice.parseMessage`, the entire `[key_name, timestamp]` pair was passed into `KeyPress(code=None, tDown=rt, name=message)`. Consequently:
   - `KeyPress.name` was stored as `['f', 0.76319]` instead of the string `'f'`.
   - `KeyPress.value` was also set to the pair.
   - Any filtering using `getKeys(keyList=['f'])` failed because a list is never equal to a string (`['f', 0.76319] != 'f'`), silently discarding all keypresses.
   - The timestamp from `event.getKeys` was discarded, and `rt` was assigned from an ad-hoc `clock.getTime()` call at parse time rather than the true press time.

### Solution & Changes
1. **Unpack Key Name & Monotonic Timestamp (`psychopy/hardware/keyboard/subprocess_keyboard.py` lines 704–725):**
   - Unpack `key_name` as a string and extract monotonic timestamp `t`.
   - Set `tDown = t` (absolute monotonic time).
   - Accurately compute `rt` relative to `self.clock` by accounting for the time base offset:
     `timeBaseDiff = self.clock.getLastResetTime() - logging.defaultClock.getLastResetTime()`, `rt = t - timeBaseDiff`.
   - Preserve fallback behavior when a bare key name string is passed to `parseMessage`.
2. **Process All Buffered Events (`subprocess_keyboard.py` lines 638–644):**
   - Iterate over all key events in `event.getKeys(modifiers=False, timeStamped=True)` rather than solely consuming `name[0]`.
3. **Automated Unit & Regression Tests (`psychopy/tests/test_hardware/test_keyboard_event_backend.py`):**
   - Added unit test suite covering:
     - `test_key_name_and_value_are_strings`: Confirms `KeyPress.name` and `.value` are strings and equality comparisons (`press == 'f'`) succeed.
     - `test_key_filtering_with_keylist`: Verifies `keyList=['f']` filtering works and non-matching keys remain buffered.
     - `test_multiple_keys_in_same_tick`: Confirms multiple keys in the same tick are all dispatched in order.
     - `test_timestamps_and_reaction_times`: Verifies monotonic timestamps and relative reaction times are accurately populated.
     - `test_parse_message_shapes`: Verifies `parseMessage` handles both pairs and bare strings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9535622fbcaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.