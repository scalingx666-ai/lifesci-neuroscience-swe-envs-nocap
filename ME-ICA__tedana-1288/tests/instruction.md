# Issue

**Title:** Add Rica integration for interactive ICA component visualization

## Description

## Summary

Adds Rica integration for interactive ICA component visualization. Every tedana run now creates a launcher script that handles Rica setup on demand.

## Key Changes

- **No CLI flag needed**: tedana always generates `open_rica_report.py` in the output directory
- **On-demand download**: Rica is downloaded when user runs the launcher script, not during tedana execution
- **Faster tedana runs**: No network calls during analysis
- **Self-contained launcher**: The launcher script includes all download/setup logic
- **Rica button in HTML report**: "Open in Rica" button with popup instructions

## How It Works

1. Run tedana as usual (no special flag needed)
2. Find `open_rica_report.py` in your output directory (full path is logged at end of run)
3. Run `python open_rica_report.py`
4. The script downloads Rica (if not cached), starts a local server, and opens your browser

Alternatively, open the HTML report and click the "Open in Rica" button in the top-right corner for instructions.

## Features

- Automatic Rica download from GitHub releases
- Platform-specific caching (Linux: ~/.cache, macOS: ~/Library/Caches, Windows: %LOCALAPPDATA%)
- Cross-platform path handling using `pathlib.as_posix()` for reliable Windows/Mac/Linux support
- `TEDANA_RICA_PATH` environment variable for developers to use local Rica builds
- `--force-download` flag to launcher for manual updates
- Cross-platform launcher script with built-in HTTP server and CORS support
- Graceful fallback if download fails (uses cached version if available)
- "Open in Rica" button in HTML report with modal popup

## Usage

```bash
# Run tedana
tedana -d data/*.nii.gz -e 14.5 29.0 43.5 --out-dir output

# View results in Rica (full path shown in tedana output)
python output/open_rica_report.py

# Or with ica_reclassify
ica_reclassify -c report.txt --out-dir output
python output/open_rica_report.py
```

## Test Plan

- [x] Unit tests for rica.py module (91% coverage)
- [x] Integration tests include open_rica_report.py in expected outputs
- [x] Works with both tedana and ica_reclassify workflows
- [x] Cross-platform path handling verified (Windows backslash fix)

## Files Changed

- `tedana/rica.py` - Simplified to generate self-contained launcher script
- `tedana/workflows/tedana.py` - Always calls setup_rica_report()
- `tedana/workflows/ica_reclassify.py` - Always calls setup_rica_report()
- `tedana/tests/test_rica.py` - Updated tests for new behavior
- `docs/outputs.rst` - Updated documentation
- `tedana/reporting/data/html/report_body_template.html` - Added Rica button with popup

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e9d5484c6dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.