class TinyfugueRebirth < Formula
  desc "TinyFugue Rebirth"
  homepage "https://github.com/ingwarsw/tinyfugue"
  head "https://github.com/ingwarsw/tinyfugue.git"

  conflicts_with "tee-clc", :because => "both install a `tf` binary"

  depends_on "libnet"
  depends_on "openssl"
  depends_on "pcre++"

  patch :DATA

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-getaddrinfo",
                          "--enable-termcap=ncurses"
    system "make", "install"
  end
end

__END__
--- a/src/output.c
+++ b/src/output.c
@@ -203,6 +203,10 @@ static void  (*tp)(const char *str);
 #define morewait 50
 
 String status_line[][1] = {	    /* formatted status lines, without alert */
+    STATIC_BUFFER_INIT, STATIC_BUFFER_INIT, STATIC_BUFFER_INIT,
+    STATIC_BUFFER_INIT, STATIC_BUFFER_INIT, STATIC_BUFFER_INIT,
+    STATIC_BUFFER_INIT, STATIC_BUFFER_INIT, STATIC_BUFFER_INIT,
+    STATIC_BUFFER_INIT, STATIC_BUFFER_INIT, STATIC_BUFFER_INIT,
     STATIC_BUFFER_INIT, STATIC_BUFFER_INIT, STATIC_BUFFER_INIT,
     STATIC_BUFFER_INIT, STATIC_BUFFER_INIT, STATIC_BUFFER_INIT };
 #define max_status_height   (sizeof(status_line)/sizeof(String))
