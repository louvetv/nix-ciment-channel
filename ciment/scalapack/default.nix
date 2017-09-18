{ stdenv, fetchurl, cmake, gfortran, openmpi, liblapack, blas }:

stdenv.mkDerivation rec {

    version = "2.0.2";
    name = "scalapack-${version}";
    
    src = fetchurl {
      url = "http://www.netlib.org/scalapack/scalapack-2.0.2.tgz";
      sha256 = "0p1r61ss1fq0bs8ynnx7xq4wwsdvs32ljvwjnx6yxr8gd6pawx0c";
    };

    nativeBuildInputs = [ gfortran openmpi cmake ];
    buildInputs = [ blas liblapack ];

    hardeningDisable = [ "format" ];

    meta = {
    	 description = "Library of high-performance linear algebra routines for parallel distributed memory machines";
	 homepage = "http://www.netlib.org/scalapack/";
	 license = stdenv.lib.licenses.bsd3;
	 platforms = stdenv.lib.platforms.all;
    };
}
