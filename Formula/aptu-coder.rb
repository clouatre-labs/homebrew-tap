class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.2/aptu-coder-0.22.2-aarch64-apple-darwin.tar.gz"
    sha256 "e0352b7d762e3d3629bf8a0030ae41dadf499b4c54a896b283f14f9a3136e9d0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.2/aptu-coder-0.22.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "006709f8e1d5e42493380c56b6f874dfec366932da706fc3b5123ac3216f2845"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.2/aptu-coder-0.22.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "bf26cef20095a1b64c29033772adc71c2d32fdd81c9aea5a03200669ba1846b3"
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
