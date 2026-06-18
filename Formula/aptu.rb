class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.0/aptu-cli-0.10.0-aarch64-apple-darwin.tar.gz"
    sha256 "bcd4b71acf1e31e1de1885447d798343019f5e87064873df0fb106ad4d856749"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.0/aptu-cli-0.10.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "6058e21e8ddec2f3cbbf5316fd9768b213a072aec9613ba6fb621516fa1b05da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.0/aptu-cli-0.10.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "cc399792ba68700480c9ce6f8bf217afdd46cb6a3a85212054ac473b3dcc57dc"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
