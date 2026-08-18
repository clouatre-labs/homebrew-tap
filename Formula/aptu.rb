class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.11/aptu-cli-0.10.11-aarch64-apple-darwin.tar.gz"
    sha256 "cbd5124643bbf0f4aba120c86c61d8cad2c701a53424085aab67d16f866b8c5b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.11/aptu-cli-0.10.11-aarch64-unknown-linux-musl.tar.gz"
    sha256 "3bfc8476c1778269d687a91c40c8b96cb075cd22e5574b71016d54fd34073764"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.11/aptu-cli-0.10.11-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1213fa4f133487842364470c5b3ed328dae1701519f9752d91303a58d1cee142"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
