class Swamp < Formula
  desc "Teh AWS profile manager"
  homepage "https://github.com/felixb/swamp"
  url "https://github.com/felixb/swamp/archive/v0.12.0.tar.gz"
  version "0.12.0"
  sha256 "1a4fa47aa45fcfaf53fcaca58820fd770dc8b3312a808b7addb5c1887e6b07d0"
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
