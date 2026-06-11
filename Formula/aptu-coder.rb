class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.1/aptu-coder-0.16.1-aarch64-apple-darwin.tar.gz"
    sha256 "ef120b79faeac33e45ebe4de09533e216d4e091f969951f1c5509581b3c05b82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.1/aptu-coder-0.16.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "fb3400a270068717fe0f0c94fd9af526f866dae32c486acc19d6077b232c36e6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.1/aptu-coder-0.16.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6adb4ece4f5a1072ec20189e417f5b1bc50a4d36ad5d8675a1bbb304897f5e77"
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
