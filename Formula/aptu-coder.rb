class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.1/aptu-coder-0.35.1-aarch64-apple-darwin.tar.gz"
    sha256 "b749cd607bb1b35220ed1da209d06d4413d7d9b2958617a762c039254c0da8d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.1/aptu-coder-0.35.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "bf8442cda2148deab2cffc330911231c188771383ca1da2e809ae8f02fcfb474"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.35.1/aptu-coder-0.35.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3033b1bb817d71d574dc4e528b286709884a62425043dc0b4cd635a3f50578f6"
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
