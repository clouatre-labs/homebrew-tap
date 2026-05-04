class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.1/aptu-cli-0.5.1-aarch64-apple-darwin.tar.gz"
    sha256 "6c8db31f8aa8a2087326bfe310e229531e10321a920213b867bf9ee9357d1d1c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.1/aptu-cli-0.5.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "316a4b9ee696a387830133d7cad6d6261d67ad4a581635d1caffdebf0aec9dbc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.1/aptu-cli-0.5.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ba2aad7723a6e8ede99e612e3caed56084bffcf0a9e43616f3ced62f6f8c13aa"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
