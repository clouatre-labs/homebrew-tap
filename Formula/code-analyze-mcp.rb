class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.5/code-analyze-mcp-0.2.5-aarch64-apple-darwin.tar.gz"
    sha256 "8edcd80f6539966635fbb64e911153455642d00e77f5d6beede9b5e1ad4c32f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.5/code-analyze-mcp-0.2.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a4e7bad0a50adc1b159b9caba72121d06ef9a5a12ddcc50d3f0370d0038722c1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.5/code-analyze-mcp-0.2.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2dc96aa09510c307ee45e46a399c8653fb3cf3b7bc1984088300175858ced03c"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
