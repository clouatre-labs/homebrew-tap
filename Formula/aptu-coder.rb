class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.4/aptu-coder-0.13.4-aarch64-apple-darwin.tar.gz"
    sha256 "5989c9e83815cfcd1fa407a8def1c8161ae202444f93119ace18fd2c047ef419"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.4/aptu-coder-0.13.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ecd1368440e709d3b6df680feb1416feaf0c4c168b4b401b37e6a62096a9d550"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.4/aptu-coder-0.13.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d6d793a44bcfddeb033885185cafbac18c017a72cd0f141942e961ac7fd7758d"
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
