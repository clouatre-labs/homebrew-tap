class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.3/aptu-coder-0.18.3-aarch64-apple-darwin.tar.gz"
    sha256 "de0cdd847ebb64422777aee38489a2b220d5dffaa94da167dc24ec51f498cb7b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.3/aptu-coder-0.18.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d9a06d8ac381b05fe0789520d353c3de49e442b414d5106d5ead2e0d60fda25e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.3/aptu-coder-0.18.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5a0185f93ff25d6c107c1696b977b9ca2aeedc464744be61f7e5d0881e22811f"
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
