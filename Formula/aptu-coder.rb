class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.1/aptu-coder-0.17.1-aarch64-apple-darwin.tar.gz"
    sha256 "728a58235beacac02b02565accb03da634db0643d55fe615e739a1f234b2b829"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.1/aptu-coder-0.17.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0415b90b7bafef74da5ae62d6b1856165f9238eb8e086f426e503fca4cffcc8e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.1/aptu-coder-0.17.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "dd53bf7a9d1c05d15fe2d48dd8882d17a16d3e9944b24b1fe2934626c7ae414e"
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
