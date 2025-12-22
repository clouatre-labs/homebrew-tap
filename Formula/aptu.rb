class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  version "0.1.2"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.2/aptu-aarch64-apple-darwin.tar.gz"
    sha256 "a3b1c08b49ced8120c134e6642fbdf128bc7be217fa5e8e441b1d46afc95515d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.2/aptu-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8865a36873520379fc04b0d73490cd7c5157d019cfbcbdf88e1a4c0e84f7415b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.2/aptu-x86_64-unknown-linux-musl.tar.gz"
    sha256 "321c13de1163b6e9b84ba472ba4f9c29b142386651bbae87962947f3a1669fa1"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
