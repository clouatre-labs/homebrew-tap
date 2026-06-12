class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.6/aptu-cli-0.8.6-aarch64-apple-darwin.tar.gz"
    sha256 "cbd0f37516eb0364ba69655e3f4e6c5eab14ccc1aaa2b34b481c7b8f8af090fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.6/aptu-cli-0.8.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "fa006d82d0cc5bf8a25f010de5830c81d351d63b9d50002d1bf72dbe1644d4fc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.6/aptu-cli-0.8.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9950b1e1b341647afeaa85301e6e8b455e1cd6f56adc113b9d938826b60a4d4e"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
