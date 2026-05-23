class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.0/aptu-coder-0.15.0-aarch64-apple-darwin.tar.gz"
    sha256 "05babe54652f54cd7fe0c06364b437c6c1b9f8dcc43a25f01273f28af52d80a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.0/aptu-coder-0.15.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d91ac683f2ad3deb54bfc0a11f5b784dbf00d40b5dec384a7342fb1abd95adb3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.0/aptu-coder-0.15.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "cef34f26442fc63d93b4adc18021390b36dabc524930cea7a159a987d863be30"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive true
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
