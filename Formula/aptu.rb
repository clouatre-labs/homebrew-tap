class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.18/aptu-cli-0.10.18-aarch64-apple-darwin.tar.gz"
    sha256 "5f678851bbc3930b2281e3f79cb97e028422e437981c28171e2e12e57de9c78f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.18/aptu-cli-0.10.18-aarch64-unknown-linux-musl.tar.gz"
    sha256 "05b35332f6727606b2406a8a91117d57cf00c1821653e2f0795a45904464b83d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.18/aptu-cli-0.10.18-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4d5e75b9a185191177f5bb382aa288322c18d405d0458d7bd84a90dbcb936bff"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
