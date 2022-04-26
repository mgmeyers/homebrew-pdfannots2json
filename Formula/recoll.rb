class Recoll < Formula
  desc "Desktop search tool"
  homepage "http://www.recoll.org"
  url "https://www.lesbonscomptes.com/recoll/recoll-1.32.0.tar.gz"
  sha256 "e24b7a839315653c982d21fbab6cfbda7cc0b14e9f6ad0b4bd379b10a85203a1"
  license "GPL"

  depends_on "xapian"
  depends_on "qt@5"
  depends_on "antiword"
  depends_on "poppler"
  depends_on "unrtf"
  depends_on "aspell"
  depends_on "exiftool"
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "unzip"

  def install
    system "./configure", "--disable-webkit",
                          "--disable-python-chm",
                          "--disable-qtgui",
                          "--enable-recollq",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/recollindex", "-h"
  end
end
