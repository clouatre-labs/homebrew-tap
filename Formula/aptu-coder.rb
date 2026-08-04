class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.27.0/aptu-coder-0.27.0-aarch64-apple-darwin.tar.gz"
    sha256 "524cecd683e2d4da611882db44be8a5370798311d8027f3074acb93d9e74f4a3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.27.0/aptu-coder-0.27.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "78b6a3b0b735341075f604812560453a2e6cd88e58c43cdc264bdb4cd1c25d83"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.27.0/aptu-coder-0.27.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e70072381925fc81483706eb9d88cd3404e1c227d5b057ebc3d7bc1024730027"
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
