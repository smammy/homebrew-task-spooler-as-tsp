class TaskSpoolerAsTsp < Formula
  desc "Batch system to run tasks one after another (installed as `tsp`)"
  homepage "https://vicerveza.homeunix.net/~viric/soft/ts/"
  url "https://vicerveza.homeunix.net/~viric/soft/ts/ts-1.0.2.tar.gz"
  sha256 "f73452aed80e2f9a7764883e9353aa7f40e65d3c199ad1f3be60fd58b58eafec"
  license "GPL-2.0-only"

  livecheck do
    url :homepage
    regex(/href=.*?ts[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  patch :DATA

  def install
    system "make", "install", "PREFIX=#{prefix}", "PROGRAM=tsp"
  end

  test do
    system "#{bin}/tsp", "-l"
  end
end

__END__
--- a/Makefile	2022-02-07 09:59:57.588065440 -0500
+++ b/Makefile	2022-02-07 10:09:34.066375195 -0500
@@ -18,14 +18,15 @@
 	info.o \
 	env.o \
 	tail.o
+PROGRAM?=ts
 INSTALL=install -c
 
-all: ts
+all: $(PROGRAM)
 
 tsretry: tsretry.c
 
-ts: $(OBJECTS)
-	$(CC) $(LDFLAGS) -o ts $^
+$(PROGRAM): $(OBJECTS)
+	$(CC) $(LDFLAGS) -o $(PROGRAM) $^
 
 # Test our 'tail' implementation.
 ttail: tail.o ttail.o
@@ -52,10 +53,10 @@
 ttail.o: ttail.c main.h
 
 clean:
-	rm -f *.o ts
+	rm -f *.o $(PROGRAM)
 
-install: ts
+install: $(PROGRAM)
 	$(INSTALL) -d $(PREFIX)/bin
-	$(INSTALL) ts $(PREFIX)/bin
+	$(INSTALL) $(PROGRAM) $(PREFIX)/bin
 	$(INSTALL) -d $(PREFIX)/share/man/man1
-	$(INSTALL) -m 644 ts.1 $(PREFIX)/share/man/man1
+	$(INSTALL) -m 644 ts.1 $(PREFIX)/share/man/man1/$(PROGRAM).1
