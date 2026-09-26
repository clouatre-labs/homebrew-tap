class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.36.0/aptu-coder-0.36.0-aarch64-apple-darwin.tar.gz"
    sha256 "e559295c06dd68230dc8888aeed998efb1777c1bdc43834d55eb772184b33e35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.36.0/aptu-coder-0.36.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "c86de081b8097c2dbff019911669acedb3b359eb33203199b9cfdf9d2e0321c0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.36.0/aptu-coder-0.36.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "dbddf1270134107ab5d6fdb3f28733e54a0358a9b4ad9f0667e5391e14a69ff4"
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
