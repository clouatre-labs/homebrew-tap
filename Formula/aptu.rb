class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.0/aptu-cli-0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "de0efb9819951d1cec3baaea05da9a92c2b68cd63663e45cc741a81a9836bcae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.0/aptu-cli-0.8.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8983d463e4a9538850684757f15d4bd64fc7967ea6b0e33ab1f662d5f2f629c5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.0/aptu-cli-0.8.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "31d71038d7174215bdd523cdd6f83296c014d6173d5117a0ba87c07b0cba3f24"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
