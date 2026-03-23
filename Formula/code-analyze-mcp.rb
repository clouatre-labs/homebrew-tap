class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.8/code-analyze-mcp-0.1.8-aarch64-apple-darwin.tar.gz"
    sha256 "08a18f3069e8007e71c7aa964d0eeb3f4c65ddd7b8c3ba1efa5d26eb3434b09d"
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
