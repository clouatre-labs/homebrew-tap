class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.11/code-analyze-mcp-0.1.11-aarch64-apple-darwin.tar.gz"
    sha256 "8f9e9124be62680d76992627218694d8b7b34699e79ca84fda8869c8ca4cba7a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.11/code-analyze-mcp-0.1.11-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f08e426f1eabe2311194ffa80362407fd254034433997342939b5d321afe03c8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.11/code-analyze-mcp-0.1.11-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9d728afbd80c739094c90dd5a488c400effdcc9bb308f5df16c01dc83a3c7de6"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
