class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-mcp-0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "595ba022224b59e38dad7e5e718817b253cd1089f035d776de33ad42075dcd10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-mcp-0.4.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "85f232466cb49eda3f9a5caeaaafeac5e3867a7f0f15a86346588868904172f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-mcp-0.4.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c30e94123f3eba096016dd7c639811a8c0f526d30a8c60e50c68a691b16c3029"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
