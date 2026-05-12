class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.12.0/aptu-coder-0.12.0-aarch64-apple-darwin.tar.gz"
    sha256 "cecbecc326de89d55bd1cc0172530a85cf56335a6658bcbb3e78edbd81df7e72"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.12.0/aptu-coder-0.12.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "12f9e92496195dd1155adb5341adfb4980bae6ee965890e9c569d704c689ed9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.12.0/aptu-coder-0.12.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "15c475ba06f165e4e511ef279aebf3f2116770c59226cbc5a8b1903507b1c263"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
