class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.3/code-analyze-mcp-0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "e2f8d5cff3171a72e3fa450df67b85fae9e4414a66ee0ea9e2e57f751b45405e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.3/code-analyze-mcp-0.1.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ed215ee26cadb1592921fe01abd77b0938357ec69c410808e7b65948e3a89926"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.3/code-analyze-mcp-0.1.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b014b98103c98e05208f4cdb55d0a0676122f0384a81510b96bf56765cb4e29c"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
