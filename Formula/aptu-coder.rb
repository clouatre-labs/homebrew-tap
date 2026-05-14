class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.12.1/aptu-coder-0.12.1-aarch64-apple-darwin.tar.gz"
    sha256 "7d59a8a40c5dfa0d0dbdb9855968355d891eb2388100e0f1e3244774efe433b2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.12.1/aptu-coder-0.12.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "46f1668b011a02d37487b3b61d33378cb7f4462844ad9558c9daa9d4bf72b911"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.12.1/aptu-coder-0.12.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5364b34124966f40c181916057b77f458f4f4430a0f73f9e636ce44be6b3514a"
  end

  def install
    bin.install "aptu-coder"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive true
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
