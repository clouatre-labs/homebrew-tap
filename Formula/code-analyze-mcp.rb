class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.4/code-analyze-mcp-0.2.4-aarch64-apple-darwin.tar.gz"
    sha256 "55fb6c6b5835706e2841f0d9c36001c711b586a5dc3e589ca0cf4348d30deace"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.4/code-analyze-mcp-0.2.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "82d1cd510b39fdfb04e0ca7e73a584685b8ddec24eda95fcc0e337ba1ae30bd8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.4/code-analyze-mcp-0.2.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "86103f8bbb29a1b4e3c96cef92d62a68361b5a786a36e1bd3152f4ee5afaba40"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
