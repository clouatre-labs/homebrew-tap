class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.3/aptu-cli-0.10.3-aarch64-apple-darwin.tar.gz"
    sha256 "8f06404016238f649a045f9f743179162b392dff72c8043044a86ac8ff2e1cd4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.3/aptu-cli-0.10.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4f963436f92aba3de13d90ee4b815679a7dadba07660056a3dff2812ff1588f3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.3/aptu-cli-0.10.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ed3b5ce2983454e75693d9e180c58d5084da6e403f26141ce3e59928f92ab620"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
