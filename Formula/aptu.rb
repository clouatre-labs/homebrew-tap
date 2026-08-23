class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.13/aptu-cli-0.10.13-aarch64-apple-darwin.tar.gz"
    sha256 "01deea05969a5a95579857a4269156a2885f7f74458f1ded268fb290db33e648"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.13/aptu-cli-0.10.13-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d0f0edd9632800376ecfe648b751f2207a63e7215f4741ad5ccf3df250ff3575"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.13/aptu-cli-0.10.13-x86_64-unknown-linux-musl.tar.gz"
    sha256 "36c689ce92fbbe64e53262121a711091f67216a84eac1db42506c8874adf24f0"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
