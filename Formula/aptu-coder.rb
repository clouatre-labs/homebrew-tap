class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.3/aptu-coder-0.32.3-aarch64-apple-darwin.tar.gz"
    sha256 "2833420f62d1086228560bca9523b6fd11218cf12df3deff66a85e1393a1f50f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.3/aptu-coder-0.32.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "83c412f21fe713d467adaa19a7a137afe49e62cb27672767070f16d3ec6f2447"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.3/aptu-coder-0.32.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4675110a346d5afcd3c6d91864cb8b0c8cc917c29a3534284f547cc67b481bab"
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
