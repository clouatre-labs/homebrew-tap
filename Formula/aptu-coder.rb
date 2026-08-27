class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.2/aptu-coder-0.32.2-aarch64-apple-darwin.tar.gz"
    sha256 "f29d57ea5cca7c438bdde81dc3e50135c141aa794dcb3a23f6b005ad459aba60"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.2/aptu-coder-0.32.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "6fe371691574da9027163c079e409232013bd149e28c9c40f94f165015625ac3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.2/aptu-coder-0.32.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "aeffe195cb01a6a22203cee4db353fdcb8fbbe7e8e599bbf5855ec7c26828097"
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
