class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.0/aptu-cli-0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "ea446e45fc84eceb5ae020b7cd65625236d2b5fe4faa55c68068c75945cce2fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.0/aptu-cli-0.3.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "01418852ff44682ca0d133bad99a0e33cf0570bb594b716300f626c71701a0e8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.0/aptu-cli-0.3.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a5cf623c25c5e518c04a125e45963b852d38f20da64053b61b926ba127b21e80"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
