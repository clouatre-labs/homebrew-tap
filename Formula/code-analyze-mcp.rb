class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-apple-darwin.tar.gz"
    sha256 "760bc038577f79447b230b9413bdea208e93d103e7160913f7c54182bdc42eef"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-aarch64-unknown-linux-musl.tar.gz"
    sha256 "da1444ef4fd1da99ebca17185ecd948dff40306dcc9c0f7bbec4cbf5e7651471"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.10/code-analyze-mcp-0.1.10-x86_64-unknown-linux-musl.tar.gz"
    sha256 "34473335ee4d3cb079315cfb4fdb29c3ebfe68cb5ee8b1d857afc7a82c8a7478"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
