class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  version "0.1.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-aarch64-apple-darwin.tar.gz"
    sha256 "7e5632eb8063583506099974723bfa09fc8dd0dcc6b7614337847e946c4902a0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-aarch64-unknown-linux-musl.tar.gz"
    sha256 "af3b45f14549c7c1b463ea3274ef422741ac11753e7334e25f0ad13a0971b34c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-x86_64-unknown-linux-musl.tar.gz"
    sha256 "915ad045ece11e7d81989e67d05587ad03c42be1ef177a829847533432f75ec1"
  end

  def install
    bin.install "aptu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
