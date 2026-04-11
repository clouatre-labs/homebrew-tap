class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.1/aptu-cli-0.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "69f17300b7812aead190f513921fdf138001db57264acad26818a0fa0b865652"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.1/aptu-cli-0.3.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "af42100285c5d3683d69a8848d695c5d8a0cf596a828afef8f87c2d69fbfa9d0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.1/aptu-cli-0.3.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2ede8e2297a26f97d7723eb83b2c9a5f869e4ce82ce6b0ab920cf43db2c8eebd"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
