class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.2/aptu-coder-0.29.2-aarch64-apple-darwin.tar.gz"
    sha256 "313462c5481f9b5aae6a63adb2b55bd2c4b2f4a27bc8dc60b0252d71f2eb1742"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.2/aptu-coder-0.29.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8b37387af844ff9e4790a1b08bcb71c9740911eb8866ea32bde90d9d7f3a471e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.29.2/aptu-coder-0.29.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6a1cd2ee4004b1813bb9efc593b1bef7ea9c34eec1924fc6966142c363409349"
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
