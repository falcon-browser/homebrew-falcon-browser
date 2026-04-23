# homebrew-falcon-browser

Homebrew tap for [Falcon Browser](https://github.com/falcon-browser/falcon-browser) — a pure-Rust headless browser engine with HTTP API and MCP server.

## Install

```sh
brew tap falcon-browser/falcon-browser
brew install falcon-browser
```

## What gets installed

| Binary | Description |
|---|---|
| `falcon` | Core CLI — DOM + embedded JS (QuickJS) |
| `falcon-api` | HTTP adapter |
| `falcon-mcp` | MCP server adapter |

## Requirements

- macOS (Apple Silicon or Intel)
- Rust toolchain (installed automatically via Homebrew as a build dependency)

## Source

- Main repo: https://github.com/falcon-browser/falcon-browser
- Formula: [Formula/falcon-browser.rb](Formula/falcon-browser.rb)
