class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/archive/refs/tags/v0.1.9.tar.gz"
    sha256 "9423a8778ea6a0975f3f5be78bad4481cfd758dac2db377d01291f0a9b019a66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.8/code-analyze-mcp-0.1.8-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ec363541e48dea5bc0a2a176fee08f8efc805aa31d0562123fe82afa8b370800"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.8/code-analyze-mcp-0.1.8-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9768fc1e3ca27eadd726733682f190aaf5e723c9eb4c567615d0ffad2011c9b2"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
