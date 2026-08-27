class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.1/aptu-coder-0.32.1-aarch64-apple-darwin.tar.gz"
    sha256 "b32738bb68004f8bba5349e8eed79b2845a4da2472f0eea5706526523ebba1c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.1/aptu-coder-0.32.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "c030ea09a9ba1b13f5f2d987072ad6b09d6c9b99154aa0f3cb14655d94686700"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.1/aptu-coder-0.32.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5eeb105201e51a03dbb81a9bf9efdaac8a943b5d3110cbc2dbc45f3505ae5b2b"
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
