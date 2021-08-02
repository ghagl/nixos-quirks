{ pkgs ? import <nixpkgs> {} }:

pkgs.gcc10Stdenv.mkDerivation rec { 
  name = "env";

  nativeBuildInputs = with pkgs; [
	pkgs.cscope
	pkgs.ctags
	expat
	python
	texinfo
	bison
	flex
	unzip
	openssl
	perlPackages.XMLSAX
	perlPackages.XMLSimple
	xml2
	wget
	bc
	rsync
	zlib
	libxml2
	ncurses
	pkg-config
  ];
  buildInputs = [
	
  ];

  hardeningDisable = [ "format" ];
}
