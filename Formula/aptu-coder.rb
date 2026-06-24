class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.21.0/aptu-coder-0.21.0-aarch64-apple-darwin.tar.gz"
    sha256 "70b8b6751f41fdcd8d7f8b5fb0384d21dccd5d00e7dc4aae0a76c786af26dd54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.21.0/aptu-coder-0.21.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "17e3580a208b7c0811a0bf93aa4c1a65d68b389e96449a2b496a195be8b78a3c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.21.0/aptu-coder-0.21.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4f9c5f8e4544c6ef63a1db1f4550321c398564cc0397118e153ac3cea5ab9d61"
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
