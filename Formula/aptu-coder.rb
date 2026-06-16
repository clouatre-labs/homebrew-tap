class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.3/aptu-coder-0.17.3-aarch64-apple-darwin.tar.gz"
    sha256 "a3c5541350cc84d9a2fffde0e422147e4cdc189c00d15fd89b99cae37a73c5cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.3/aptu-coder-0.17.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5a12105618e30f4a52f33d61b3c2a4fae3cbde489801b9265a68f997da8f7fef"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.3/aptu-coder-0.17.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3e5765b135ceeaa03d992435a4fb679dde494a2a25d029183650ca961cf6986c"
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
