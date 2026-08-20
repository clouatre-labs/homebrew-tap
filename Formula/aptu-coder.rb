class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.1/aptu-coder-0.29.1-aarch64-apple-darwin.tar.gz"
    sha256 "fe543590217d5454f014ee7cbd9f66f37a43f7ff6a61a2c7fa100b4fd93ba1f2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.1/aptu-coder-0.29.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "57c0e222ffae5b29abb060a07ea39ab5bda754e3d58359d8be11d7803efd4982"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.1/aptu-coder-0.29.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5d366cbbad2e31c96e17a99f28411ec098c8a13b7e7db2660e5438bccc7d119c"
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
