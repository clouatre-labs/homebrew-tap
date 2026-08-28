class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.4/aptu-coder-0.32.4-aarch64-apple-darwin.tar.gz"
    sha256 "6db60c180dbd7a22711c75f58b2cf68ad68535469fec4b5344b63ae6b74ac236"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.4/aptu-coder-0.32.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "419c987c0494f8283704a57a41408e57a7102f9be07122bc70f4123401f11365"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.4/aptu-coder-0.32.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0550438e128cb4aa2516b41959ed54196d611eec799edc37c7ec450201b202ee"
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
