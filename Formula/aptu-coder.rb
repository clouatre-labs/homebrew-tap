class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.41.0/aptu-coder-0.41.0-aarch64-apple-darwin.tar.gz"
    sha256 "b646aee8eb8d9b79654714b586b32a315da58a5772db66fe14f9d54acf3f5014"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.41.0/aptu-coder-0.41.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "cb2af7c8889fb60a06f9d0d4febb943cde6839002c125d2291cad438a051f462"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.41.0/aptu-coder-0.41.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b8f0de5a169c8de7d3d345bca5e7a1430e1a28ec238b8ae2609871c9ca3e4e18"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive false
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
  end

  def install
    bin.install "aptu-coder"
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

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
