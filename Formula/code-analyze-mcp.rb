class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.6/code-analyze-mcp-0.2.6-aarch64-apple-darwin.tar.gz"
    sha256 "71a541441ec3c36d79154dfb71aed4eaa2ca0433a2305e17eb83fb0186626c1f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.6/code-analyze-mcp-0.2.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0286c763058c3b8c0bbb5a06e09cf0bf3d70b2377c2b934a126f57fad09b949c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.6/code-analyze-mcp-0.2.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "cef8645d7b29087729dce69ec3427b8f49a29e6596b22a34947a72a85a959681"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
