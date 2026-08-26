class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.16/aptu-cli-0.10.16-aarch64-apple-darwin.tar.gz"
    sha256 "8be8d7a7370df7ed79879c6dd9cef971b63d89c8d8105fea3f7cba7a8a7f8205"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.16/aptu-cli-0.10.16-aarch64-unknown-linux-musl.tar.gz"
    sha256 "14ffb7bbd344835fd98fadb352181c5144e186e41ee5205811f3a4bda2214655"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.16/aptu-cli-0.10.16-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fffe0c84d849bc75727b407c9b6a3523db69c547acbf36b224c5aec48257ad3c"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
