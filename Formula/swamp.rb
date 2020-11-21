class Swamp < Formula
  desc "Teh AWS profile manager"
  homepage "https://github.com/felixb/swamp"
  url "https://github.com/felixb/swamp/archive/v0.12.0.tar.gz"
  version "0.12.0"
  sha256 "58c517f21160e19015d98a758a94bf8ebfc390cf1b3532c360cc890378ad5163"
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
