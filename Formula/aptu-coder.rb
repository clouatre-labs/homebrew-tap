class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.2/aptu-coder-0.34.2-aarch64-apple-darwin.tar.gz"
    sha256 "565c2ee6961090029771a0f5bfa7e442c7f2539bcdd4458d72a7eefaac879401"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.2/aptu-coder-0.34.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "fb1a4a532902d7855c2c948a6c32e24ecb536380cf1c91770e4a448738c96e76"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.2/aptu-coder-0.34.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d5a48087ec8f2416899fa458ed038949814b902fc0a6cef1cc1a1d1b72499685"
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
