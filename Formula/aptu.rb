class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.6/aptu-cli-0.10.6-aarch64-apple-darwin.tar.gz"
    sha256 "2b298c2a4a831593b3614f28bed9a35ada692009049773674e130586fa914dc7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.6/aptu-cli-0.10.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "21ee950a96d4a58ef6000132b92d73cc679736334e3edfd48f3474720c12cf6e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.6/aptu-cli-0.10.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "664e688bf10cb0c1f98d489ba7599e96e98f35d4e56161573d945d30e6b72bd3"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
