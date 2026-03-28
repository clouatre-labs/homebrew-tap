class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.1/code-analyze-mcp-0.2.1-aarch64-apple-darwin.tar.gz"
    sha256 "ae6ef126f191b54e9a2ee045ac452af7d872f750d89f3d84765d104245dae911"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.1/code-analyze-mcp-0.2.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "6f4b18e2cb697cd4addbc6f119e9ddba1cb728c0c21404249c8e85d48c5f92bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.1/code-analyze-mcp-0.2.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5e764229f9f334ebb9d764d1897a1cb769ca7227841603b80412ece6a3e0d6ae"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
