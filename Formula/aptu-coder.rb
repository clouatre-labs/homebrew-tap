class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.0/aptu-coder-0.22.0-aarch64-apple-darwin.tar.gz"
    sha256 "4d1262bd2efbc9d7af6f7bd3a0d71e1ea4e892cbbee22a6ff7fce62f23db1978"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.0/aptu-coder-0.22.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "23c053e0b5d9ef5752f858d6ecc1810363166b6a545281f65a984efbfb511cf1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.0/aptu-coder-0.22.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "721990af4c7ec19c7e2774191f96f299296d034a5e7b44a4d660a444736dd21c"
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
