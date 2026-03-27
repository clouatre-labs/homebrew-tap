class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-apple-darwin.tar.gz"
    sha256 "a86cf00a6d88d5afb6c1a5853c83cda75dce506b7c23b4062181f4a84d4d6530"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-unknown-linux-musl.tar.gz"
    sha256 "238b9e6d143875bee8de3d4099ab0fbdce4ea33396631771e098731c160349ac"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e3b3e219a6be02ebade02fa0f408ae561b6c36e9cdd9081d4d3fa3537ff28033"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
