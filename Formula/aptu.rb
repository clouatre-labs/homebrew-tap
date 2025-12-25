class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.4/aptu-0.2.4-aarch64-apple-darwin.tar.gz"
    sha256 "0b19c63d7f1b96a6d78aaad4a43e409e9eb3ee3c64042504ff1290358148b96c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.4/aptu-0.2.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "6a6455cd30915a928a1027363b4c5b26016ce9968703eff12edd2d8ce6258061"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.4/aptu-0.2.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1b2a3018ccf6dfb2526c31e98e093ff219726a1f5fa41e09b148dba3ef0d027a"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
