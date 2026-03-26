class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-apple-darwin.tar.gz"
    sha256 "53afa401c293938e5232452d151ab5d02a9e190163e84b7e3c10ff070f8ad83f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a243ddf92677ce82349e83003966d8b656c574cd96ec3869822cd72df462b5b6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-x86_64-unknown-linux-musl.tar.gz"
    sha256 "602ede6833aaac286800dd6c7d92e5b5d91fdf30e0851982ed37a0c65d0ba225"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
