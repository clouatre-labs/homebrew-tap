class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.24.0/aptu-coder-0.24.0-aarch64-apple-darwin.tar.gz"
    sha256 "b779836b2033b250142c73347f8da3b519785f55d23570c6f3d3c63ed1ff32e3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.24.0/aptu-coder-0.24.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "09f31db63309e8e9212fccf25bb1c59463f6da0add1e327560a81ee2e7c4f5cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.24.0/aptu-coder-0.24.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "92d085acffd02a668897c4bb95589a68bef9802392e73140f5330a7b885ba1f7"
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
