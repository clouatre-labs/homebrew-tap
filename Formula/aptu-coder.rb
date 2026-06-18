class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.1/aptu-coder-0.20.1-aarch64-apple-darwin.tar.gz"
    sha256 "5e0c15349f72deda1edb8134ca733867f10213f52f831997b4e74eca60a48d6e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.1/aptu-coder-0.20.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "591314ab459082257edc0d75c9b897deebf49d0108f9ff2cdedbee3614bb142c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.1/aptu-coder-0.20.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c54612b226eabafd1fdee3b6773a1595d02ae1330026896a14d98e37c379d638"
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
