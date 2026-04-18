class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.2/aptu-mcp-0.4.2-aarch64-apple-darwin.tar.gz"
    sha256 "36c901f6553d9b18fcf48badedbf9adaa7ed0687e8fb8a85b8eaed239029e835"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.2/aptu-mcp-0.4.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "641ff9a1ca0fed3f54107eb18fd3a412d37fc0a719f6106e4d54b6ff06ea1dc0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.2/aptu-mcp-0.4.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e5707da847403dbd26e0c91f2e6deb67e316e9ac0db2aff99228aaf145044883"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
