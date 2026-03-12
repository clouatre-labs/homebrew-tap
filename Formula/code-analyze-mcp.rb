class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.2/code-analyze-mcp-0.1.2-aarch64-apple-darwin.tar.gz"
    sha256 "78c34e74857e8553ac85fddd736bc7e87e65f0286ce6b5f9d3b75b82c5d03a24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.2/code-analyze-mcp-0.1.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "556341d5b44e6205782cb3b29f61562bc7bc5496d80e45f2b544f8b5ebb12aa2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.2/code-analyze-mcp-0.1.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f1cead54a0c2c3e757f3b940da7d67bb34d54b01bc92425daccffc9e99e2e735"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
