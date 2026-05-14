class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.0/aptu-coder-0.13.0-aarch64-apple-darwin.tar.gz"
    sha256 "aef6b4ac1d277d6adca4100c2112e3ad374bd4f9d804d3ae18305d385ab043b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.0/aptu-coder-0.13.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "9cc4d4d07c4a860fe7e3d9b72ffd7440c91dee427190adc24c5996f669c28c41"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.0/aptu-coder-0.13.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "590205bd66ec43b9730c4a6b149e55743fc33300c298364c742cd15e791c1213"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
