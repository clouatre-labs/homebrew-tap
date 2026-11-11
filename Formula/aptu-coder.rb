class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.46.0/aptu-coder-0.46.0-aarch64-apple-darwin.tar.gz"
    sha256 "64a2dd788c250b3bf6aa2c97f82450aa51d1020846f6822e515ed727e53bb8d1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.46.0/aptu-coder-0.46.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a73c574c53b03b50bd8c037ed44a1d1c8a975085298c2e2147d98bd5c317adcf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.46.0/aptu-coder-0.46.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "046e601e1b15d28d19008492490e5550fa2517228b3d010b784661343e144d90"
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
