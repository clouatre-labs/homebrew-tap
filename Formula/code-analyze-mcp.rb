class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.5/code-analyze-mcp-0.1.5-aarch64-apple-darwin.tar.gz"
    sha256 "a1a520778febf05170db48cced1d7db86ddaceeaa889eee9bb3ba00be9dab05b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.5/code-analyze-mcp-0.1.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "63d2e98ebddedff1e42d6e2e5fe6c4d557105144325f6165a79217bd55d2a9b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.5/code-analyze-mcp-0.1.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ba4d6cae2a9bac6e14a3a28005ac27156796a02a01451a29ec24561fb518833f"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
