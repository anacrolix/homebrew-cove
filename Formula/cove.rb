# This is the homebrew formula for cove.

class Cove < Formula
  desc "A combined BitTorrent frontend and DHT indexer for personal use"
  homepage "https://github.com/anacrolix/cove"
  version "0.4.10"

  def self.cove_url
    os = OS.mac? ? "darwin" : "linux"
    arch = if OS.mac?
      Hardware::CPU.arm? ? "m1" : "amd64"
    else # Linux
      case Hardware::CPU.arch
      when :arm64 then "arm64"
      when :arm then "arm"
      when :x86_64 then "amd64"
      else
        raise "Unsupported architecture"
      end
    end
    "https://github.com/anacrolix/cove/releases/download/v#{version}/cove-v#{version}-#{os}-#{arch}.zip"
  end

  url cove_url

  def install
    bin.install "cove"
  end

  test do
    system "#{bin}/cove", "-version"
  end
end
