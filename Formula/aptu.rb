class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.12/aptu-0.2.12-aarch64-apple-darwin.tar.gz"
    sha256 "2c7672940f2f7142962ad049591380f7c18b3da508eb64f466d40350a83d1fe0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.12/aptu-0.2.12-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a98e610e7a68f58d424d14b34072d21204af9bc32a5375eec2065a90ab56765a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.12/aptu-0.2.12-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fec4e1f936add5b76566a8b58b9dbe97fd3a1b474e387ebce62c86fce3c06f13"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
