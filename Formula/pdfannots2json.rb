class Pdfannots2json < Formula
  desc "Extract annotations from PDFs and convert them to JSON"
  homepage "https://github.com/mgmeyers/pdfannots2json"
  license "AGPL-3.0"

  url "https://github.com/mgmeyers/pdfannots2json/archive/refs/tags/1.0.3.tar.gz"
  sha256 "6daeb9fbc63cad9986c9b2b8633c598024cb104dff6b9f91e0fca680299797a8"
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
    assert_match "v1.0.1", shell_output("#{bin}/pdfannots2json -v 2>&1", 2)
  end
end
