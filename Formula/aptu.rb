class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.3/aptu-cli-0.8.3-aarch64-apple-darwin.tar.gz"
    sha256 "1fa946526e12c0fce40ec925db2d07812769a465fd6c8914833311f45c4ec388"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.3/aptu-cli-0.8.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "035d436ea66ebd002316e71a617c92fb23a13e7e9aedb2f449b66b247c4fe512"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.3/aptu-cli-0.8.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c7577bc9f0341afbc800e7efd470304399184046759efe52e2f20e45a27fa41c"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
