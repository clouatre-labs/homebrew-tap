class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.2/aptu-coder-0.14.2-aarch64-apple-darwin.tar.gz"
    sha256 "1ebd4730d9930b423576f87f6d74fd6ef2a0b3e0a3c5330b31540cdb62d37a7c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.2/aptu-coder-0.14.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "97f481b621d780b0f1c0efff7f7ff22f9cc555d279b5ff3917a0ea6683f740d0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.2/aptu-coder-0.14.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2ff051f0f31ad3ad1d5f7d60a42884879a7068beb5192d676689753be398ced3"
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
