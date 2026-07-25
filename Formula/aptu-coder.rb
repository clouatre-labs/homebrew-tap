class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.3/aptu-coder-0.25.3-aarch64-apple-darwin.tar.gz"
    sha256 "6d07314bcd53a6aeb77453da5db5bcfec7ac8ebf3b557658acfee715f6685834"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.3/aptu-coder-0.25.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "34048f0e63fb68d55875238e9f7ba9c5fea0901a88aeb875c2c625a3c1813d6b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.3/aptu-coder-0.25.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7091dc7b2700b2601aa2ed3307cd1ad73dca5ca3ff4f8112365a57176a98502b"
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
