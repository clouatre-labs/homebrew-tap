class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/archive/refs/tags/v0.10.20.tar.gz"
    sha256 "a8f551f8e4fefdca286a7147600c77d2d533da0bf8af1e82aa4be4e518c8be69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.6.0/aptu-mcp-0.6.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "331420e001575f7023aadf467afa067ebfe781e9569a57cb630de4847f97bfdf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.6.0/aptu-mcp-0.6.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "91d27e2f7b756ad639dd5fa03f92a9d3d588aac19ac547db05c98820591c006e"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
