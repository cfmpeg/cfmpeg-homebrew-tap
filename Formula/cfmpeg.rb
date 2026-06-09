class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.1/cfmpeg-darwin-arm64.tar.gz"
      sha256 "02529f417024ba9b77d5ecb826e2313d852c5f677c69245554bc5428c96701fd"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.1/cfmpeg-darwin-x64.tar.gz"
      sha256 "dcfc702f2c6039645ac62afdc9dca3b86b9fe027237d45d38dfbe4b55b7be182"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.1/cfmpeg-linux-arm64.tar.gz"
      sha256 "ce6d03e2a08bffd64a015c4dd9e6279f13e6b710199a805bf2adf683b957ebd0"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.1/cfmpeg-linux-x64.tar.gz"
      sha256 "a2aae8ee9f240a457d8ded36723cb1f1f6c97433c022d996b8044ebd91d9cccd"
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
