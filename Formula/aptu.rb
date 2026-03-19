class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.17/aptu-0.2.17-aarch64-apple-darwin.tar.gz"
    sha256 "1050e92e95dac1bb7c6afb721d15bf54194b12b8b969ddaf30460183b553ef85"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.17/aptu-0.2.17-aarch64-unknown-linux-musl.tar.gz"
    sha256 "32e3f013bc66d24177e3963beb21e03706af844c0c383a540737824457a925f8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.17/aptu-0.2.17-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d3d959c1fc3738c57686589c0c44b7f2e92de75f342ecaccdec5e23351817f81"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
