class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-apple-darwin.tar.gz"
    sha256 "15a236c0866c177c79b79fa529bfde30259af1a2d40f86406e374bfbb1c9a8db"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f710f32ca9dfbee0ab6258581a2a71814002252d3709ca09ce0686b2b86bc6c1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7b5e924bddd6800ab47f2b0edd80997382f97d67976540e5cba20e94c74de6a6"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
