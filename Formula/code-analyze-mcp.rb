class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.0/code-analyze-mcp-0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "7eefd30c7f3ba793fd02cf4d9205fb30e413bb3d13c0169944da86842b19c4b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.0/code-analyze-mcp-0.2.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b7ede51ccb505765437a4c4841e9b39dd308845a6351b58d585e63a5721e78a8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.0/code-analyze-mcp-0.2.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ea04893ac99575bb8d113ba4a96d4be3b18d4b29b7b44a0a84785a816ef8fff7"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
