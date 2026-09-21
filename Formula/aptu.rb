class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.11.0/aptu-cli-0.11.0-aarch64-apple-darwin.tar.gz"
    sha256 "ab755ff607aa0aea9ce7a9c77744c0036c06287f7581e0225e77c104357f6c63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.11.0/aptu-cli-0.11.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ff4dd11dcb664f121ee858acf574032a063930c0ffcb95b32a3fe25b07f2411d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.11.0/aptu-cli-0.11.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "06094cf8aa5dd928f268f7c6149fe9831f46aee05be760b0a624dec44855643f"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
