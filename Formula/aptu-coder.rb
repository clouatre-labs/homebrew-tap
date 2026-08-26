class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.30.1/aptu-coder-0.30.1-aarch64-apple-darwin.tar.gz"
    sha256 "19c9c1fe2e7eb7e88c38f18147357a3d884b4e814c3b81c8869619a397e7edf8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.30.1/aptu-coder-0.30.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "71237276769df67bc0e446e0d59454f278e61092e64922af96cb2fe407463e0f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.30.1/aptu-coder-0.30.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "586e5f1b6b9fb69ff5a2716e0ea7a3bde6e449c3716e75c368b20ff4ff9296c0"
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
