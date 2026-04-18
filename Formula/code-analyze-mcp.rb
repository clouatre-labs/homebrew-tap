class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.6.0/code-analyze-mcp-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "f6fa88ee86e28f8e97e5d2c39589693cc11f7f1c497868c0ec4794728436ef49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.6.0/code-analyze-mcp-0.6.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ec2d25bfe0279bcadd2c7ab0452b787afb3c5293373e2be4cc65791b535d9fc9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.6.0/code-analyze-mcp-0.6.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f1efc2a2ea363a068357234cf141b8cb339c6e6dda8b34fb1fabc0374f81660b"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
