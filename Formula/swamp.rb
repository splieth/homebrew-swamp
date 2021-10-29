class Swamp < Formula
  desc "Teh AWS profile manager"
  homepage "https://github.com/felixb/swamp"
  url "https://github.com/felixb/swamp/archive/v0.14.0.tar.gz"
  version "0.14.0"
  sha256 "e83e2fed018d5a66a8e6a79ad1fa9433815d0cd67aa81754bec361dea8a17b2d"
  head "https://github.com/felixb/swamp.git"

  depends_on "go" => :build
  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/felixb/swamp"

    bin_path.install Dir["*"]

    cd bin_path do
      system "go", "build", "-o", "swamp"
      bin.install "swamp"
    end
  end

  test do
    system "#{bin}/swamp", "--version"
  end
end
