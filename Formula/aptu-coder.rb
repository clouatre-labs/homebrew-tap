class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.30.0/aptu-coder-0.30.0-aarch64-apple-darwin.tar.gz"
    sha256 "aa6358592dd10022bc9fea694f37b8b5955db3d8cec976053f799f2855bd021f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.30.0/aptu-coder-0.30.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "aa791ddf8ec552871cd488d3c99cabd752a9060d1ee69d326010bb424cee3c49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.30.0/aptu-coder-0.30.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e1ea0107426177ca64f2df54ee74c332aa0011df7a3883b0d12323fb23ac31b2"
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
