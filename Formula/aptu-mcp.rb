class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.1/aptu-mcp-0.5.1-aarch64-apple-darwin.tar.gz"
    sha256 "34fef1fb97620f9b5affedb24f05ca6b9d36d977ccf499864063f8d0ad5f67fe"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.1/aptu-mcp-0.5.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5aa3de4fb59ccb5bfb661ed0a6d7ce69910fc2aba48c565ba0a14f84fe2ad17d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.1/aptu-mcp-0.5.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d9465aad65bdef1ec13f6c51157bc533461287e5dc02ecb7f731c1238ad2eb08"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
