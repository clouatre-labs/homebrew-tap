class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.0/aptu-mcp-0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "66f7d737c7469917c582e6e69b2bf7221b92e758382f50b28766989b09918bfd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.0/aptu-mcp-0.3.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "524503992913e53cce2e0287df89029a57d67aaa444988db32e2adfb86feeaac"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.0/aptu-mcp-0.3.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4e4d3c53327c3c9c2ae72c6e6b6ac94e938719b0ecba3708bc94c1ef6c32c8a3"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
