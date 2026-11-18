# Issue

**Title:** add AI chat side panel with bring-your-own-ai support

## Description

Zero-dependency chat assistant using raw fetch + SSE streaming. Works with any OpenAI-compatible endpoint (OpenAI, Anthropic, Ollama, LM Studio, Groq, Together, etc.).

- useChat hook: builds EEG spectral context from live FFT data (band powers, dominant frequencies per channel), sends to configurable /v1/chat/completions endpoint with streaming
- ChatPanel component: sliding side drawer with settings form (endpoint, API key, model), message thread, and text input
- Eco mode: when no API key is set, echoes the full context snapshot the AI would receive — useful for prompt debugging
- API key never persisted to localStorage for security
- Toggle via 🧠 Chat button or C keyboard shortcut

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7bf9d4d6030e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.