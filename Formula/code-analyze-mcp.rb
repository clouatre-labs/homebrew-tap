class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.7/code-analyze-mcp-0.1.7-aarch64-apple-darwin.tar.gz"
    sha256 "15ec672408d7c30173412fbc1b6ed16182ad07915bfc1ff47d1071464170aaf5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.7/code-analyze-mcp-0.1.7-aarch64-unknown-linux-musl.tar.gz"
    sha256 "727fd7ff9d7795648cb874ff73e550693d134fab71a903139a181089e117013e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.7/code-analyze-mcp-0.1.7-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7da18b469586a83ebb7ba156cb8cf106d270163c79faaad069503f5be1794de0"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
