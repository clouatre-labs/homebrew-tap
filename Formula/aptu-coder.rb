class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.0/aptu-coder-0.18.0-aarch64-apple-darwin.tar.gz"
    sha256 "47162a9f2426480fa2cf35eadc38478de083cab53623641bfdc3367eb18048b2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.0/aptu-coder-0.18.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "371f251590706fd85e07554cebb2c74af62d0b196b830300dc9d84687fe4a5e7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.0/aptu-coder-0.18.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2714d2148c1e4dc69c149898bf3329ddc78afe4c1787768328bdb223d670e17f"
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
