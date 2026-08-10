class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.0/aptu-coder-0.29.0-aarch64-apple-darwin.tar.gz"
    sha256 "001e8a23e1fce4ff3e81af68bc524a29fc8aaff4842f3ac726ff4a61a904830f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.0/aptu-coder-0.29.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "3275903aa0a472cd94bb8a92b74ad4ce85e80290c8c6a983df109e6b954b7994"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.0/aptu-coder-0.29.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5ad58455d3fb433d5ab518a33f93d16c72780c00634a4ef9a45c96985ad17f82"
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
