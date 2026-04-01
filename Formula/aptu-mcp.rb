class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.22/aptu-mcp-0.2.22-aarch64-apple-darwin.tar.gz"
    sha256 "f3fd892c12d921fb2c38cc1c143ba6b57efd30aa2b74c4c86c49033ed10ed413"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.22/aptu-mcp-0.2.22-aarch64-unknown-linux-musl.tar.gz"
    sha256 "792f10c093cd591f7b040542c9edbd62b59b3ffd0205fc26a34816a41720491a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.22/aptu-mcp-0.2.22-x86_64-unknown-linux-musl.tar.gz"
    sha256 "99ba1c71c4830e5e3652ced69d7d2c53c97cf74ff58e121f2080f04ded1667c0"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
