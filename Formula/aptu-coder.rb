class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.0/aptu-coder-0.34.0-aarch64-apple-darwin.tar.gz"
    sha256 "cef7875ca7e1be44b64d8cfbf32034c5a7220abc202eec5695804fd258bc6b3b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.0/aptu-coder-0.34.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b03c0148200900f4fb6ff8b0c879c02f1be77f4235359a72c48627c4992c37d0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.0/aptu-coder-0.34.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6c6f02fb7876a28f4f929bf9e83457a93af2a60269612d4cff23e0bfc0105c76"
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
