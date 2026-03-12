class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.1/code-analyze-mcp-0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "78369ec261bb9761af975951d0ef2b64fffc8817eb81986f9ae197b0cca74032"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.1/code-analyze-mcp-0.1.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "60ec36878c0c47f1566bdc8a87f1c223ceaf19d7eed1400095775ade4fee8db5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.1/code-analyze-mcp-0.1.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a2053e3d663b313240fe8c37b676615da55ca2fdd72c9cbe7ef0ef9a3e86ce65"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
