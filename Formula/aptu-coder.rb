class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.45.0/aptu-coder-0.45.0-aarch64-apple-darwin.tar.gz"
    sha256 "8bb9bd61e87fc642249934ecba53a7966f83f2143850d96c4acb0881f97873cf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.45.0/aptu-coder-0.45.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5d3b25f9f6641fbced6cbba354758d4e15f7eb78a03a57db87da2b53d1c66b40"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.45.0/aptu-coder-0.45.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1171e2f89eab00bb63a09fcd41cf05e24db92eb79799a0bd1d32115dbd4f5279"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive false
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
  end

  def install
    bin.install "aptu-coder"
  end

  def caveats
    <<~EOS
      aptu-coder defaults to stdio mode: your MCP client (e.g. Claude, goose)
      launches and manages the process directly. This is the recommended mode
      for single-client use and requires no background service.

      To share a single server instance across multiple MCP clients, run it as
      a persistent HTTP service on port 49200:
        brew services start clouatre-labs/tap/aptu-coder
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
