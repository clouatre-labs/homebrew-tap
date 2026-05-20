class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.1/aptu-cli-0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "f1dbb0a145ec0c271c313dbdc9a5e2e556f9a3c35498aea9386424f54f8e9ea8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.1/aptu-cli-0.8.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e37819bf04674dbbf0434e392806827f696d5f2ba1ec1a38a0776a3351818863"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.1/aptu-cli-0.8.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2cbd1ffdabf7d506c854ccd17fb5db4992b1bdf45ac56f9619226095f2ceb736"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
