class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.3/aptu-coder-0.16.3-aarch64-apple-darwin.tar.gz"
    sha256 "475e1b167c2ad6cffeb868d9ed9ad8cc2cda9cf7ce07c88e096561de089be380"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.3/aptu-coder-0.16.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d20132543ade93711f0e83961271779480d7f47dd8d3d63a64f69176f49aba31"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.3/aptu-coder-0.16.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6a9e4f640598cc241153ed0eb3bf656896ba1c8478ea1bfe753b48c24b2fd193"
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
