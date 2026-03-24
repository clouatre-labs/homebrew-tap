class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.9/code-analyze-mcp-0.1.9-aarch64-apple-darwin.tar.gz"
    sha256 "93f144559bf3f37749f3741d87c7585978f766d1259e190c93c71f722cb07e7e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.9/code-analyze-mcp-0.1.9-aarch64-unknown-linux-musl.tar.gz"
    sha256 "eb31a5f63cb676bc1d3b95dd316e49213f2319794b386f912befe1a7556348f0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.9/code-analyze-mcp-0.1.9-x86_64-unknown-linux-musl.tar.gz"
    sha256 "95f1deb444760538fdcd5d60a83b3773f61a57b164ace671dc91f331372a9d9b"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
