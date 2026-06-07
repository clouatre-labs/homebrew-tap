class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.4/aptu-coder-0.15.4-aarch64-apple-darwin.tar.gz"
    sha256 "d58033f59f0565542aa82070b403d5743d69ef87d41af6e0b76ee38983bdaf04"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.4/aptu-coder-0.15.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b6b65fc835fa3fd2df31304b5e6fe90c4afcda6de63f176acfa30baeee49878c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.4/aptu-coder-0.15.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5dc416ef1aa67378cdc65299e716a6ff70bd331eab94c2b48e5de79346aed7a4"
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
