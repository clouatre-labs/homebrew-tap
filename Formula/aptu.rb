class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.1/aptu-cli-0.10.1-aarch64-apple-darwin.tar.gz"
    sha256 "43b03ec804ba7423e0941514d6b2b87344f20740dcf46d082510440da54789be"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.1/aptu-cli-0.10.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f3aafd59a5deee859a374227447490ec5a7d7c25a651d7b68e4ccd2e933ade76"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.1/aptu-cli-0.10.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fa60ddb9b080846b0b454239e5f7ed3fd2f38a72ea6273903f7ec0971037de9b"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
