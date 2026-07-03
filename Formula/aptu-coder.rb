class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.3/aptu-coder-0.22.3-aarch64-apple-darwin.tar.gz"
    sha256 "d6161a1b46689db4a73878563ccb163479dc745410a79eca9c631f25330b63ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.3/aptu-coder-0.22.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "bd01efc0a6aa7410be751e6595d77646450e231f5635d1e257a579ab6b3abd68"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.3/aptu-coder-0.22.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7fcd57c153b27318c7a0a60b0844ea94f1b3ffbe87cd03eff4dad4445465a0a3"
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
