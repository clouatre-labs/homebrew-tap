class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.3/aptu-0.2.3-aarch64-apple-darwin.tar.gz"
    sha256 "bd7f8dc0606fa1090fb0f8edf3d2b74691ba00fdca80cdccdaf5249255fc2b04"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.3/aptu-0.2.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "24e8d913aa20350373fcfb8df93fd25143e07ee1fcfde493141748401ec2cd2a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.3/aptu-0.2.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "16c9f01e1f5ff1c1396b4ed28e85bd98013e9789ce179c2a3d7b2d681f1a66eb"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
