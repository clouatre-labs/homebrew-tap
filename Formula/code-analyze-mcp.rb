class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.2/code-analyze-mcp-0.2.2-aarch64-apple-darwin.tar.gz"
    sha256 "d67b2a1e0b6b45423aef11a1b7fe74006b19fbb93fe67889f2dec46e40bd8962"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.2/code-analyze-mcp-0.2.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "446900bd6891382cb1f8e48f71819e718b0e6af090903168edbedf1f215fc7ec"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.2/code-analyze-mcp-0.2.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4c2b4baed60cc45052599a73e699b1358dd4e512336e052a823745d26a1fb745"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
