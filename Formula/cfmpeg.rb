class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-darwin-arm64.tar.gz"
      sha256 "b294cbfdaeef55eb0c25846ba48eeeff2f8abc23183bcf98e1f688ec2dd748bc"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-darwin-x64.tar.gz"
      sha256 "e0a3dfb3ac4668aefce27370816a098e3ca7518b24fa19e6efd7c50476635818"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-linux-arm64.tar.gz"
      sha256 "b172c75c02537b3644cca5c194c2758655c73d31147e1ba6deabda0701ab31de"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-linux-x64.tar.gz"
      sha256 "c805b3053f219d111e64bed2bf6c23fc45ef74e91a29b07049ce907db9459e70"
    end
  end

  def install
    bin.install "bin/cfmpeg"
    libexec.install "libexec/ffmpeg", "libexec/ffprobe"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cfmpeg --version")
    assert_predicate libexec/"ffmpeg", :exist?
    assert_predicate libexec/"ffprobe", :exist?
  end
end
