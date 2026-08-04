class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.8/aptu-cli-0.10.8-aarch64-apple-darwin.tar.gz"
    sha256 "78632a90ecede3acd648d562c83acf302c2380a4c661ea0f04b5217b97c7edd0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.8/aptu-cli-0.10.8-aarch64-unknown-linux-musl.tar.gz"
    sha256 "dfc62448e95e7da0741e1f08e1e65ef0bcb16d1aebdfe4ee6d077fc1a02f4989"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.8/aptu-cli-0.10.8-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d1ee75955ab9cda6f5f0b8aaf2fa94e271bd0af6db2129e9fc2d845cee276468"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
