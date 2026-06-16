class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.9.0/aptu-cli-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "530d317cddd0e80481f314115a61d0735e776cac3d2e43af4f4b4a6238629d63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.9.0/aptu-cli-0.9.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "6de75fe219d69995a4b1546324e2bed108ae4ab189ed93f396a6f6cc4619daef"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.9.0/aptu-cli-0.9.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "900a615cf43eeb731a88eca962799575496e75660564e55b59a88f9376e7ebf9"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
