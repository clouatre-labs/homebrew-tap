class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.3/aptu-coder-0.20.3-aarch64-apple-darwin.tar.gz"
    sha256 "eea5b3d24e49164f9df9d8176f333d754128dcecc580b192d1d95137baa0a01b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.3/aptu-coder-0.20.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "62f7a08e300182461d5b68467c676f0f0a9aacb6b678d10b3f57ce715daa8952"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.3/aptu-coder-0.20.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2e7678200f20112226b8003aa9b10da330fda5bbb8efb3ac673d4b0cc460b1fa"
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
