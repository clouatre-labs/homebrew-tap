class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.14/aptu-0.2.14-aarch64-apple-darwin.tar.gz"
    sha256 "8d44ce6fcda89f66171ed8cad99660a572963cb413c427ae0eac3f76094f4414"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.14/aptu-0.2.14-aarch64-unknown-linux-musl.tar.gz"
    sha256 "48d478a282f97d8d53a35e991d5584dc16efea67b239d769665d2f72222ffc54"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.14/aptu-0.2.14-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9b145af135825494f752afa852944e660ef4c0bfe77cc2fb3b0747e7f5fde21f"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
