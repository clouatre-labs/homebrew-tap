class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.0/aptu-mcp-0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "488d84ace906540d49faf0c1806beeeca9674feb9bfb419126416be625c062c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.0/aptu-mcp-0.5.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "9df104712cd40966745a5590ec0c854a1dcf8afbc3cd3b18397fbd5d82b4490f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.0/aptu-mcp-0.5.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7a146d1c3b07f14adfca2b990203b484b08208f050715e71989becaf4ca94738"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
