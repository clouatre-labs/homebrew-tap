class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.10/aptu-cli-0.10.10-aarch64-apple-darwin.tar.gz"
    sha256 "43fa93ca9f458b9a7e2342926f95036b4364719c495184d25b6b89356b334429"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.10/aptu-cli-0.10.10-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5d62a016871bf3594c0c3b8ac202c47032bfd26fa0db05b00a2c1bd3a3524ed6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.10/aptu-cli-0.10.10-x86_64-unknown-linux-musl.tar.gz"
    sha256 "714fa52fb6281cf97548d88d8e332cf7c5be4559953538b7f4b0e2ac13c322e7"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
