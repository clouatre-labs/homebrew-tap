class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.2/aptu-cli-0.4.2-aarch64-apple-darwin.tar.gz"
    sha256 "9e6b9332d70828d65ece40c9010ca1163ad429c05c1d485ad865cacf3e9482e6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.2/aptu-cli-0.4.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b9b79a6b5021d07c61d26b3e9fa20e0e6694442b4197af0f0e65dde58068e503"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.2/aptu-cli-0.4.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c0974bb4edf6f77c238a0e0b0b986d9c151655bc6d09038454eff2334a81af55"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
