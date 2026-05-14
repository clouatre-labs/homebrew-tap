class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.0/aptu-coder-0.13.0-aarch64-apple-darwin.tar.gz"
    sha256 "e80c1830a15594fadfa50b406496618b3de38286df0dffb54d8e425dcb0cb98d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.0/aptu-coder-0.13.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "51cb268add723df3ae0e31c528137e24f1085319ad615f0e658c76bb65128981"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.0/aptu-coder-0.13.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "96190bc2bca8a3c90e1d7829a71e98918cb9077926fd401a9b7a3128c846d8e3"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
