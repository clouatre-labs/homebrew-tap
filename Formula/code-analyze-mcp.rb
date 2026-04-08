class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.3.0/code-analyze-mcp-0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "da43fbc548cdd1f104b8d31a20644481ccaa5a81f31b327a01d235265895ded5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.3.0/code-analyze-mcp-0.3.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "82e329936f4a5dc96ce92c93eaecafe92af229ba0a16f236073282cb5cd72c55"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.3.0/code-analyze-mcp-0.3.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "507dd02768174f32f201a22166372e2b4c94cd836e0081e649c81448d557825a"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
