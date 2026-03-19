class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.16/aptu-0.2.16-aarch64-apple-darwin.tar.gz"
    sha256 "995058d1b7b8e1527e0d25ddd99a61532b518e54f1ad94933499f00dcb6d630b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.16/aptu-0.2.16-aarch64-unknown-linux-musl.tar.gz"
    sha256 "235d781f32d9be383c68438dce7067c259228f4201c238e784da5eda57885f13"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.16/aptu-0.2.16-x86_64-unknown-linux-musl.tar.gz"
    sha256 "073215dc2bd4c263f8fcffd8f2c6406852c9b6ee75fe940cb8d8222b51c417f8"
  end
  
  def install
    bin.install "aptu"
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
