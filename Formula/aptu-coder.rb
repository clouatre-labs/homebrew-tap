class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.5/aptu-coder-0.20.5-aarch64-apple-darwin.tar.gz"
    sha256 "2d5b199978d8122aacd72610f41d2d3a6c944bfcb747536b6efb096b0b4e4aba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.5/aptu-coder-0.20.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "1ad9a9d5c1327d332e4e5ffe3412195629d9400e5fb2a0ac26e8191e5017fffa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.5/aptu-coder-0.20.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2f556f120dc1fe91274d255d0a58c56aed4846adb17744ecd77919cd963af935"
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
