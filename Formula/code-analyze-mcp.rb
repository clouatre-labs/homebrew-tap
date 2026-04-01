class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.3/code-analyze-mcp-0.2.3-aarch64-apple-darwin.tar.gz"
    sha256 "76569de72473f37de225fd58a1b4f9525f8cf6e7e51172e5c71a2a19a85425ac"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.3/code-analyze-mcp-0.2.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4a10d3913d9b9029107a8ef1be851a3ec41903693ff4b24c3a663c81396a922e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.2.3/code-analyze-mcp-0.2.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "005b9e0f00651d11c1264db60e3cd977db4e837026c719c9059dbf049eccfcfc"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
