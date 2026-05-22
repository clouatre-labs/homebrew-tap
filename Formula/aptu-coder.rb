class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.1/aptu-coder-0.14.1-aarch64-apple-darwin.tar.gz"
    sha256 "17482640b6230babf9300c8e9adbe02219f391796d920432ba584703cb9c86d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.1/aptu-coder-0.14.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "70515e922d34c7e6e07d42162eac459edfc83ca3722f19f117ad068d389536b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.1/aptu-coder-0.14.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "78efd2cf35a800a37512fc166f0e56aa06d47016d9334b6bc6a38395197be155"
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
