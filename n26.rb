# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class N26 < Formula
  desc "CLI tool for N26 Bank"
  homepage "https://github.com/jjbeto/n26"
  version "1.0"

  on_macos do
    url "https://github.com/jjbeto/n26/releases/download/1.0/n26-cli-1.0-darwin-amd64.zip"
    sha256 "c0fe129be676c4b0411721db91960ef21d6832f421a4801f67ebbea5613b77d9"

    def install
      bin.install "n26"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the N26
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jjbeto/n26/releases/download/1.0/n26-cli-1.0-linux-amd64.zip"
      sha256 "933feffee50808cd770731512247563bf60581c805c8d5d461906e389a92ddf1"

      def install
        bin.install "n26"
      end
    end
  end

  test do
    system "#{bin}/n26", "--version"
  end
end
