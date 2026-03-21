class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.6/code-analyze-mcp-0.1.6-aarch64-apple-darwin.tar.gz"
    sha256 "6e3a9a758410454f85c23af04e558445808a77c512daa9a60ef8a462334a8840"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.6/code-analyze-mcp-0.1.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5005c672b3a833d997819bda2ca8913fab893681be75ef0c46cc38859ceee747"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.6/code-analyze-mcp-0.1.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3103cdee048d15767f3656350d5b83111d3a3fb9e7e0f67375cd44c3cbaa0123"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
