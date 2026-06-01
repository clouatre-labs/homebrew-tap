class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.2/aptu-coder-0.15.2-aarch64-apple-darwin.tar.gz"
    sha256 "90850b6bc49cf8a6edddbb86a2fc7e630ee252979ce13f208fee2a4507d16823"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.2/aptu-coder-0.15.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "6805f75ca863c6451e3f742d48dfda6c30cd6ab5e623c2d47c216559657a5b59"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.2/aptu-coder-0.15.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e8b2cac1411d5c0ae08cfddddd150c41c691e29671202a66c2f1b956a0cae15f"
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
