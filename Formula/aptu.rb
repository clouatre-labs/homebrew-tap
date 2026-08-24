class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.14/aptu-cli-0.10.14-aarch64-apple-darwin.tar.gz"
    sha256 "35133d74caa9a5ac9a080fac7de64c686bc00a6919d893a768f220d9dc55a136"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.14/aptu-cli-0.10.14-aarch64-unknown-linux-musl.tar.gz"
    sha256 "af39b64f2ccdca1dcc18062dbab79f929545ae6e15dc9dc35507cdc14a421877"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.14/aptu-cli-0.10.14-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d7229600ba8d0eba3204243044ee3342a965de67cf06169450d5063f094b18c4"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
