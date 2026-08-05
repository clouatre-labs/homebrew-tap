class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.9/aptu-cli-0.10.9-aarch64-apple-darwin.tar.gz"
    sha256 "fcf7785e9f4766abb343ba6fa58e89ef66682cb53235b886400939e69a9b24e3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.9/aptu-cli-0.10.9-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b300fd2b1e0cc4310faf460b8940a2e5fbad59c580dedb373a0737c60776b442"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.9/aptu-cli-0.10.9-x86_64-unknown-linux-musl.tar.gz"
    sha256 "15845874d89b78fcab7dbf488eaaa5ecc8b044e8c1a3445fc22b3b1ad14f0d53"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
