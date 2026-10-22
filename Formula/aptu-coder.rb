class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.40.0/aptu-coder-0.40.0-aarch64-apple-darwin.tar.gz"
    sha256 "1caf2b0be8ca09315edbad4f87ef68133aa0bf9de61482e8d710e5aee5270db2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.40.0/aptu-coder-0.40.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "1e5ed9842c9e00a329dc47bd12a4141b4d42810e245228520b418d7949ee1000"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.40.0/aptu-coder-0.40.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "244b6d0ed9387fc7298de716657b04feaeb8ff1a21300836d6083edc641f200c"
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
