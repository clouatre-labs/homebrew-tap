class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.0/aptu-coder-0.26.0-aarch64-apple-darwin.tar.gz"
    sha256 "037bb6cbd5b1e2ec36e4c33637ef298eaaf95e1b8002f25f3690c02935f3a1e1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.0/aptu-coder-0.26.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a480b68fcab8f3fcf3eac82c74584f961ce22ba4663790b6e9b0af3fc88d06f3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.0/aptu-coder-0.26.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "46313f4f1a28d2ca5e1e38d1208550fb8bd04675b3f02062245022bd437926e1"
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
