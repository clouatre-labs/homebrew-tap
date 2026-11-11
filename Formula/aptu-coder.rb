class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.44.0/aptu-coder-0.44.0-aarch64-apple-darwin.tar.gz"
    sha256 "9062efbc46dd8d7d41f41f27682d51ba52cdd938e9f5d550b4564cc6f51e17f2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.44.0/aptu-coder-0.44.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5afcee8e9fdda904918cd64ab8be190eadedd8d5da75d1c60e2109a5fbb3a63f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.44.0/aptu-coder-0.44.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "74835fb506d64a61450b3c2a4e28e9300d5230b630112e16efa80460545d8f34"
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
