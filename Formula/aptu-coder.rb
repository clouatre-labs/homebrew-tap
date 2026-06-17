class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.19.0/aptu-coder-0.19.0-aarch64-apple-darwin.tar.gz"
    sha256 "58f394502d5e823067ad8049c60913565320d7472c2e0c3a3377862262b24c20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.19.0/aptu-coder-0.19.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d02c12299d4d440894aa8421e0064388a1b1f6a3bdd2990be1c7329f2d321da9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.19.0/aptu-coder-0.19.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b6d475dfcb566ac7d6fbbf5142167dacac2fa6ce58ee19c43182780df89c6e50"
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
