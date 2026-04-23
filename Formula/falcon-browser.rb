# typed: false
# frozen_string_literal: true

# Homebrew formula for the Falcon headless browser engine.
# Named falcon-browser to avoid collision with the unrelated
# Homebrew core formula 'falcon' (Ruby web server).
#
# To install from the current repository layout:
#   brew install --formula https://raw.githubusercontent.com/falcon-browser/falcon-browser/main/Formula/falcon-browser.rb
#
# Or from a local checkout:
#   brew install --formula ./Formula/falcon-browser.rb
#
# Note: 'brew install falcon' installs the wrong package
# (socketry/falcon Ruby web server). Always use 'falcon-browser' here.

class FalconBrowser < Formula
  desc "Pure-Rust headless browser engine with HTTP API and MCP server"
  homepage "https://github.com/falcon-browser/falcon-browser"
  url "https://github.com/falcon-browser/falcon-browser/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "27f59fbb26cdf4855cb180938a8879bb0bdd116139f0bdb30a33ef610f451c2d"
  version "0.1.0"
  license "MIT"
  head "https://github.com/falcon-browser/falcon-browser.git", branch: "main"

  depends_on "rust" => :build

  def install
    # Core CLI (falcon binary from src/bin/falcon.rs)
    system "cargo", "install", *std_cargo_args
    # HTTP adapter
    system "cargo", "install",
      "--path", "adapters/falcon-api",
      "--root", prefix
    # MCP adapter
    system "cargo", "install",
      "--path", "adapters/falcon-mcp",
      "--root", prefix
  end

  test do
    assert_match "falcon", shell_output("#{bin}/falcon --help 2>&1", 0)
    # falcon-api and falcon-mcp require FALCON_INTERNAL=1 (set by `falcon api`/`falcon mcp`)
    assert_match "falcon api", shell_output("#{bin}/falcon --help 2>&1", 0)
    assert_match "falcon mcp", shell_output("#{bin}/falcon --help 2>&1", 0)
  end
end
