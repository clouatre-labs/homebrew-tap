class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.20/aptu-mcp-0.2.20-aarch64-apple-darwin.tar.gz"
    sha256 "59096a3c773614eac62156f64c304dc2c48cf98357d8e61cedecb8fffcd8abf4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.20/aptu-mcp-0.2.20-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d4c52132051439c1c27a13fbe0753a37ebdb6941bf7b4172c37f7add56226a10"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.20/aptu-mcp-0.2.20-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5eae9e62aff41640a6192351b2d8ab56e70b1666eee1bfd36b3faca0bd8e49a4"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
