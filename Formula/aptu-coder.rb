class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.37.0/aptu-coder-0.37.0-aarch64-apple-darwin.tar.gz"
    sha256 "9393a5cd5b38f3874995f78fc77e74e9a4fc418a46ec7cda4e15a30b7dc1a118"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.37.0/aptu-coder-0.37.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "376a4ae8a50412b5eaa2801faec2b142c0f1ed239234ef9e1eb88792b7a67dd9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.37.0/aptu-coder-0.37.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f3b93f6ae595fa95a346693fb55929c3a015b227e5b1deaecf6cc66a0196aa52"
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
