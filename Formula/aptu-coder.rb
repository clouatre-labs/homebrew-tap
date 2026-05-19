class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.6/aptu-coder-0.13.6-aarch64-apple-darwin.tar.gz"
    sha256 "ba861185343933cecfe1653468d085c662f5c818b512e8e528e291849e65b1ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.6/aptu-coder-0.13.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f5672aba5ccfa11724208141ed7090cc21c1004abb9547409f83b2f4d43a6be1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.6/aptu-coder-0.13.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ab397437ed36ef887d11207bd7fae334a23aee8a94afe0ebeb3426dd036286db"
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
