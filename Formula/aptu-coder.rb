class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.2/aptu-coder-0.18.2-aarch64-apple-darwin.tar.gz"
    sha256 "8ab7bf0197cd0f550ca6df5e2dea86d22bce95b465d893397376a5c936ffe14b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.2/aptu-coder-0.18.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ea6a8c4df1d816d4353b6c589b7e722b0e74e2db0255baad585f123c6bec8a75"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.2/aptu-coder-0.18.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "230734702577a9092bdc3db01dab1da8213147de2b64d22dae47d43be9f1076e"
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
