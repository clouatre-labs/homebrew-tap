class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.2/aptu-coder-0.25.2-aarch64-apple-darwin.tar.gz"
    sha256 "227259f17340f630ce2b2a8812e14eda59b1d114ed41cb6446113e3435712c77"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.2/aptu-coder-0.25.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "fc7b28e5c381d1d5b2dee5ebf6ce713b7978c570e550bb9421743500008670bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.2/aptu-coder-0.25.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d913fde211bd3262080c8d70a6361ad0cd0a2dd4f56958fc65b38422aa979525"
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
