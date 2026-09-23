class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.3/aptu-coder-0.35.3-aarch64-apple-darwin.tar.gz"
    sha256 "d5ba8bd1cd7556f757c0e8170226d233dd484583b8de83cbcd9cc08672de14bb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.3/aptu-coder-0.35.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4675542811c4f077dfd7de4c749a5d095ee9a74e860cf9e554991010687ae39b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.3/aptu-coder-0.35.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0a4dc4f313eb93ebbee4c28285b1a096945aa8e1c886d1beaf5a6ebdc9558221"
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
