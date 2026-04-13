class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.4.1/code-analyze-mcp-0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "f8ad84fb0bf1ae09f387352e0b1fabc8cefd2ff7eb65baf2a0005a5873de8583"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.4.1/code-analyze-mcp-0.4.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "2d509eaab723083357b4eb733e5757802caab50675f300f541d0fe5eff576e7c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.4.1/code-analyze-mcp-0.4.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c5b612b99ad88a527cccba580db2f73a0b45d410bb722bbd1310a4a662c95159"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
