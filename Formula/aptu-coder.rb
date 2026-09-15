class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.1/aptu-coder-0.34.1-aarch64-apple-darwin.tar.gz"
    sha256 "62195aaccbd1041ad417b035ec8c63cc035a6df9460e492da86d23d9d8db5780"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.1/aptu-coder-0.34.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a11bf0b5d6350dabe88f79199f1a4bbaa982f32b23946a5dba68056973e70c76"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.34.1/aptu-coder-0.34.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0cccbcb1f2d8fabc080547facbcc014c43ae9d3f14e08aead611db641b587fc8"
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
