class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.5.0/code-analyze-mcp-0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "529316480fb32e8a0ad2bcdddacfe6d8e543bbff89669638122a1ce66114cb62"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.5.0/code-analyze-mcp-0.5.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "18a5179536ebcd4995889d445824a0958f7a7a2925db6b92bcc04e693af119c3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.5.0/code-analyze-mcp-0.5.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "afdd460812ae9558552199b1c659705644a67069740123500d00154f542941fe"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
