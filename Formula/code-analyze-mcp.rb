class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-apple-darwin.tar.gz"
    sha256 "5ba9fda46b49fa913f26be2fc5582898df700d18278cb2e33b432e43c451f007"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-unknown-linux-musl.tar.gz"
    sha256 "94a22da6f89d8ac6e0d6767774154b20c895c10facbb28f43042363cb50aa4af"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d9b670b7948560ea97c2cd4b5e1e1cf54ac8c1a3d2a465f5e3008891a79b7572"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
