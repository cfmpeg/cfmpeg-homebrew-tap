class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.6/cfmpeg-darwin-arm64.tar.gz"
      sha256 "8325d2941f729996caa2701a3e1cf911d481d35c0c9bc2e6c1773fa93f0f2b6e"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.6/cfmpeg-darwin-x64.tar.gz"
      sha256 "0938e9fe643ac65f19a4132b62b73a1d0848004430705a8740eec4e2c5fec5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.6/cfmpeg-linux-arm64.tar.gz"
      sha256 "89e688a64aa1a4767fd3bd6f9bc0a4f8ccb6fb87cf2ececba8c51bcd517fdd23"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.6/cfmpeg-linux-x64.tar.gz"
      sha256 "6b0179224d265128ed6adbd55bc7987853abff78eddea1b1a3f99dcf489e9e7a"
    end
  end

  def install
    bin.install "bin/cfmpeg"
    libexec.install "libexec/ffmpeg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cfmpeg --version")
    assert_predicate libexec/"ffmpeg", :exist?
  end
end
