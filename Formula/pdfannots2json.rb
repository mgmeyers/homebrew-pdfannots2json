class Pdfannots2json < Formula
  desc "Extract annotations from PDFs and convert them to JSON"
  homepage "https://github.com/mgmeyers/pdfannots2json"
  license "AGPL-3.0"

  url "https://github.com/mgmeyers/pdfannots2json/archive/refs/tags/1.0.10.tar.gz"
  sha256 "ea04811c88153e3f69bb263f0f996286001628bd61461bc48b27880e9e1c4efd"
  head "https://github.com/mgmeyers/pdfannots2json"

  depends_on "tesseract"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/mgmeyers/pdfannots2json"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"pdfannots2json", "."
    end
  end

  test do
    assert_match "v1.0.10", shell_output("#{bin}/pdfannots2json -v 2>&1", 2)
  end
end
