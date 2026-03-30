class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.21/aptu-mcp-0.2.21-aarch64-apple-darwin.tar.gz"
    sha256 "6e3dbdb6e914602e16054acb54cec3b4b268fb5ac132f69c2385c4a1b4915ae6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.21/aptu-mcp-0.2.21-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e8a147e12b6e425daa53845e07da9d7dd18a99585076ea6cedfb2ac6b2121ede"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.21/aptu-mcp-0.2.21-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0e4b468ccd6fd658df891ec80075660d5350240392f0b04e81045f7748e317f3"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
