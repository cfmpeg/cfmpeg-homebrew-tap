class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.3/cfmpeg-darwin-arm64.tar.gz"
      sha256 "4164cd794b625495fcebc8333f5150bc86b8778c1f00b27dceac78914e46c9f9"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.3/cfmpeg-darwin-x64.tar.gz"
      sha256 "3bfc57654b3670555662b7e486c7091ad11ff044b56e6a61eca08bd1d07cf3a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.3/cfmpeg-linux-arm64.tar.gz"
      sha256 "98be7a888bd4f9c1546782701c76bb04ce1d2c26bb1a9fe2b092ae00a2b1a4c1"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.3/cfmpeg-linux-x64.tar.gz"
      sha256 "3212f572c82f82ae5a73ec03046d6d408397ce64cd3ad08b96c1039145de2ac9"
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
