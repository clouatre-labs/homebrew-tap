class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.4/aptu-cli-0.12.4-aarch64-apple-darwin.tar.gz"
    sha256 "adc7138f3a4069956c1b1a40cda416bb4ec3f4e6f43a89fb5866cd03c6142fa1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.4/aptu-cli-0.12.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "c738ddb6050143df2bfad5408971c27498c08c48c32fbe68bc0aa55da88d692a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.4/aptu-cli-0.12.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f1b0d319cddfd686eb250381e626062c6a2b887c41a7c44f0bc36e9301ed0ab5"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
