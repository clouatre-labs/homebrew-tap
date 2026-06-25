class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.2/aptu-cli-0.10.2-aarch64-apple-darwin.tar.gz"
    sha256 "1055ad34eaafbc9d39f4d710f8cb27059842f612e7c14d36011ba2858d982e82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.2/aptu-cli-0.10.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b61a3a728a8acb7571bb83e5f2ab8888c935e208c4dfb9352c849d288977cf7c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.2/aptu-cli-0.10.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6860b4e41d8c355bfa517a6d523c539145024debe320a43bf4c66849c4d03880"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
