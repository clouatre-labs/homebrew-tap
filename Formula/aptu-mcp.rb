class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.18/aptu-mcp-0.2.18-aarch64-apple-darwin.tar.gz"
    sha256 "4277dd2e24b148d6e197c6ac8d05b4bb2dd71c5e3dbc157afa12a2a5f26b0c7d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.18/aptu-mcp-0.2.18-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8c4ba9a5ea7fcdfedb436eb583ae2e40d383098c48d412b5891587d3168a74b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.18/aptu-mcp-0.2.18-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1aea914913060776e37e70e1582005b4857974ee248cdd19fc23970837aa1f1c"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
