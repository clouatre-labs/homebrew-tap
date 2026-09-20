class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.0/aptu-coder-0.35.0-aarch64-apple-darwin.tar.gz"
    sha256 "f252a40c9b310f8f6eaad81b47558f147d2b43a79f8e1bb4ee317f28ed886148"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.0/aptu-coder-0.35.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "373d458bb00582afcf41266b4f71a9031cc4bbe4b6f55da526f33982bd3a7592"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.0/aptu-coder-0.35.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "419b3a9791713fbf42ee4151533e352416907630d8a9fea056560e71400b3b6d"
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
