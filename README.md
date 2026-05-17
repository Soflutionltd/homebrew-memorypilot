# homebrew-memorypilot

Homebrew tap for [MemoryPilot](https://github.com/Soflutionltd/MemoryPilot) — the fastest local memory layer for AI agents.

## Install

```bash
brew tap Soflutionltd/memorypilot
brew install memorypilot
```

Or in one command:

```bash
brew install Soflutionltd/memorypilot/memorypilot
```

## Verify

```bash
MemoryPilot --version
# → memorypilot 4.2.0
```

## Upgrade

```bash
brew update && brew upgrade memorypilot
```

## What you get

- 99.1% R@5 on LongMemEval-S (top of the leaderboard, beats agentmemory, MemPalace, Mem0, Zep)
- 100+ languages native via multilingual-e5-small + adaptive jina cross-encoder
- 35 MB single binary, zero runtime dependencies (ONNX bundled)
- HTTP API (`MemoryPilot --http 7437`) for ChatGPT Desktop and any HTTP-capable MCP client

See the main repo for the full feature set: <https://github.com/Soflutionltd/MemoryPilot>
