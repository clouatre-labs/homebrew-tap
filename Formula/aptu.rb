class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.13.0/aptu-cli-0.13.0-aarch64-apple-darwin.tar.gz"
    sha256 "3ebf2fa0993426d889394766e68fe1ecb2f0760efa42734a3073d75191d7517b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.13.0/aptu-cli-0.13.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e9648da646f0476b2dade05164ed4b21f35121743adb119b64550dbe68d898a6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.13.0/aptu-cli-0.13.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "dc2eccf721b0ec7e6ec6df4c81dd31d801883ab4cd4ee0ee3b10accbffbc1d4b"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
