# Issue

**Title:** feat: add Browser SDK (pieeg.js) for direct IronBCI device connection

## Description

### Summary

Adds **`pieeg.js`** — a zero-dependency, single-file JavaScript SDK that connects to IronBCI hardware **directly from the browser**, with no Python server, no install, and no build step. It handles device connection, packet decoding, FFT/band-power analysis, and exposes ready-to-use neural-state indices (relaxation, focus, meditation).

### Why

The existing path to read EEG in the browser required running `pieeg-server` and speaking the WebSocket protocol. This SDK lets developers go from zero to live band powers in **3 lines of code**, lowering the barrier for web-based BCI demos and apps.

### What's included

- **`pieeg.js`** — the SDK (UMD-style export: `window.PiEEG` in the browser, `module.exports` under CommonJS)
- **README** — new "Browser SDK (pieeg.js)" section with quick start, a complete meditation-app example, and a React integration snippet

### Features

- **Dual transport** — Web Bluetooth (IronBCI, 8 ch @ 250 Hz) and Web Serial (IronBCI-32, 32 ch @ 500 Hz)
- **Built-in DSP** — 256-point FFT, per-channel ring buffers, averaged band powers (Delta, Theta, Alpha, Beta, Gamma)
- **Neural-state helpers** — `getRelaxationIndex()`, `getFocusIndex()`, `getMeditationIndex()` (all normalized 0–1)
- **Event callbacks** — `onData`, `onBandPowers`, `onError`, `onDisconnect`
- **Zero dependencies** — single file, works anywhere

### API at a glance

```html
<script src="https://cdn.jsdelivr.net/gh/pieeg-club/PiEEG-server@main/pieeg.js"></script>
<script type="module">
  const pieeg = new PiEEG();
  await pieeg.connectBLE();
  pieeg.onBandPowers((bands) => {
    const relaxation = pieeg.getRelaxationIndex();  // 0.0 – 1.0
    const focus = pieeg.getFocusIndex();
    const meditation = pieeg.getMeditationIndex();
    
    console.log(`Relaxation: ${(relaxation * 100).toFixed(0)}%`);
    console.log('Alpha power:', bands.Alpha);
  });
</script>
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27e9108ef3f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.