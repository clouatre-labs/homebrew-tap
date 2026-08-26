class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.31.0/aptu-coder-0.31.0-aarch64-apple-darwin.tar.gz"
    sha256 "d7724a38320fe466359ebd66efc99c5d876a5d017f7202e7db43d8321712a7a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.31.0/aptu-coder-0.31.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b9219b39c9ec497a48d56f3108728c7736e3c3a83d1674c6add81a13fd4e0b25"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.31.0/aptu-coder-0.31.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b4e46524ea220fb7e73165694f11a4e8b27b9010ee8fe2d7434932bc3a9189c0"
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
