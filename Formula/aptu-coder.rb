class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.0/aptu-coder-0.20.0-aarch64-apple-darwin.tar.gz"
    sha256 "e9b2f32d49ab8c81b01daa14f29f1c86af89f67a529e6137f255a640b32ea5c3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.0/aptu-coder-0.20.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "cac4d76996b9462552016ed6257323e60a1e19350c40b19c0240466fa6af806f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.0/aptu-coder-0.20.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e9e9d85c600077931fdb6a93f547936fc04658e2b7b490331b72a50025e53ca5"
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
