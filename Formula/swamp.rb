class Swamp < Formula
  desc "Teh AWS profile manager"
  homepage "https://github.com/felixb/swamp"
  url "https://github.com/felixb/swamp/archive/v0.10.0.tar.gz"
  version "0.10.0"
  sha256 "4cdcdd3e7b9085de5c0f53a9783e3392680727372d89f0e38270ab8da889b1d8"
  head "https://github.com/felixb/swamp.git"

  depends_on "go" => :build
  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/felixb/swamp"

    bin_path.install Dir["*"]

    cd bin_path do
      system "make", "swamp_darwin"
      mv "swamp_darwin", "swamp"
      bin.install "swamp"
    end
  end

  test do
    system "#{bin}/swamp", "--version"
  end
end
