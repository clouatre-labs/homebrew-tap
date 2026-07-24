class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.1/aptu-coder-0.25.1-aarch64-apple-darwin.tar.gz"
    sha256 "8e1f991fbf10e82dd632a684a7860af02aa77064797f897fa8d139d631496777"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.1/aptu-coder-0.25.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "278cff68c96c8914744980e2f06a959ee92dead4dd1408db4e8a93d56f9c6dc1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.1/aptu-coder-0.25.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "407c93e23c87258dc4eb37607fc1235d7a31e17a7ba5fb576e8a03d7a51d42d6"
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
