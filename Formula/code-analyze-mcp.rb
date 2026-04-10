class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.4.0/code-analyze-mcp-0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "af89a1d87816c2b3439c4824e40571ee6400ae633a7e8a946aab8fd35987ac7f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.4.0/code-analyze-mcp-0.4.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "1e49e1aad24eeaf706855283559aee654c9fdfae45deca8bb521e8fbf5ec96de"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.4.0/code-analyze-mcp-0.4.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b50682fa802ce9c08b17193e39aae7bf96bbd996ce691a34d0d4ab335db35db1"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
