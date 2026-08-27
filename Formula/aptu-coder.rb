class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.0/aptu-coder-0.32.0-aarch64-apple-darwin.tar.gz"
    sha256 "89c53d7c4ff4a0e945fc2a56396b2cdf6e8462ebcf4e126baab79e695285bb07"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.0/aptu-coder-0.32.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "735879fcf2d6b9441863921fa24c2f42d8c28b97d6465f2283f3a98dc5d3a23b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.0/aptu-coder-0.32.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3449e5bef8f52e19aca8036ce80087a3c5f256200b03b892bb20c1828886e791"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive false
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
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

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
