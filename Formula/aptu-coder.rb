class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.23.0/aptu-coder-0.23.0-aarch64-apple-darwin.tar.gz"
    sha256 "28b10a550eca36ee289caf7726ab0d82f605936279db4d385826bcde70921807"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.23.0/aptu-coder-0.23.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5b9db74e77bc59375ee1f6bca561db494d0eda8175660b2790141f1bb153baa6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.23.0/aptu-coder-0.23.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f0d9308c7a3c3bfcda11dcafd92330cb357d7c8efbf210950118a301a7699c14"
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
