class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.2/aptu-coder-0.20.2-aarch64-apple-darwin.tar.gz"
    sha256 "62d6ea55c2375629fcf51e78084b9914a016c344ecfd5091d7601164a62caf91"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.2/aptu-coder-0.20.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "7eef96f8e35c7bf25d5d9aeeefcee311eabe9deaf2f980d0de1d443d3f5351c7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.2/aptu-coder-0.20.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3dc0a382ece29ce32bfef0485c5c34dd02f6b9aa294bc0a0e79e19a69924ea56"
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
