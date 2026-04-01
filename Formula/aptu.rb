class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.22/aptu-cli-0.2.22-aarch64-apple-darwin.tar.gz"
    sha256 "41e5531f0cc6d408f340b2a08244c2b44a8c56e6a5c4d9d2144ed04533b152c6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.22/aptu-cli-0.2.22-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4cb63ed43f327a77eabdbf3dfe2c2b33b356b497d69ac77a413fc17d88d6c1f9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.22/aptu-cli-0.2.22-x86_64-unknown-linux-musl.tar.gz"
    sha256 "abaa6fa200fa4bcb6427299418cf0e193021d11149bb192d7d4b8b9fe02aadbb"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
