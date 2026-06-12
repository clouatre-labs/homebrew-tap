class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.2/aptu-coder-0.16.2-aarch64-apple-darwin.tar.gz"
    sha256 "ca67a4e298d9b25b8556fa57702b02e8034ed2769fd356b5f0955cd4ed97cd42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.2/aptu-coder-0.16.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "7188cb94de546f3774082a809385a3d8ce61c799bc46c75a2e1aa92b825d22c3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.2/aptu-coder-0.16.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e447ca1f307bb77bb2498e552fe430de450c0f170a8f79f89c3742a6b0843a36"
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
