class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.0/aptu-cli-0.14.0-aarch64-apple-darwin.tar.gz"
    sha256 "4116fd9f98a1b7a93dde2bf94da3b499d8811e3d5c5b3aded4ec57baff2bfc31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.0/aptu-cli-0.14.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "9b16e2f96301daaca2fead93db51608559190006985a5d5991351bba87768d8b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.0/aptu-cli-0.14.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1c7fd80ff0166a4286b3fd38b69518c3c86498c9f0e424923f102d55ab4cd07c"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
