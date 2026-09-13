class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.6/aptu-coder-0.32.6-aarch64-apple-darwin.tar.gz"
    sha256 "932e6e905cc8eaba39969098f7cb0df47e5252a2157016ae06a3d2b0cb3e09ea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.6/aptu-coder-0.32.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b40147419239584b8abe0a5be305ec42bcfe9234791795ca9b102488fc639a6e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.6/aptu-coder-0.32.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "8526bf3a064cf64a7ed8ccbaa36d8850083c693deab83bd26b164a03e2ce1c48"
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
