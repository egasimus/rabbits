{ lib, newScope, stdenv, pkgs, callPackage }: lib.makeScope newScope (self: {

  dotgrid = callPackage ({ pkgs, stdenv, electron_8 }: let
    electron = electron_8;
    rev    = "e848fa0e4f5f4826a5b03085106bb37f1e97735b";
    sha256 = "1gqx1pbmz2qf2gi98aaifbgw4lksy7yykxnfz3j90zqv9l11dgh6";
    src = pkgs.fetchFromGitHub {
      owner = "hundredrabbits";
      repo = "Dotgrid";
      inherit rev sha256;
    };
  in stdenv.mkDerivation {
    name = "dotgrid-${rev}";
    inherit src;
    buildInputs = [ electron_8 ];
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/lib/dotgrid
      cp -r $src/* $out/lib/dotgrid
      echo '{"main":"main.js"}' > $out/lib/dotgrid/package.json
      cat ${./Dotgrid.main.js} > $out/lib/dotgrid/main.js

      mkdir -p $out/bin
      echo '#!/bin/sh' > $out/bin/dotgrid
      echo "${electron}/bin/electron $out/lib/dotgrid" >> $out/bin/dotgrid
      chmod +x $out/bin/dotgrid
    '';
  }) {};

  left = callPackage ({ pkgs, stdenv, electron_7, mkYarnPackage }: let
    electron = electron_7;
    rev    = "f944beea8791c0dcb551f7c61a66b9a1ccefbbe6";
    sha256 = "1y6xan6k68fdmp95caar75phf8qi9pd2g3ja1608vh6bi8la2yc3";
    src = pkgs.fetchFromGitHub {
      owner = "hundredrabbits";
      repo = "Left";
      inherit rev sha256;
    };
  in mkYarnPackage rec {

    name = "left-${rev}";
    inherit src;
    packageJSON = ./Left.package.json;
    yarnLock = ./Left.yarn.lock;

    buildInputs = [ electron ];

    pname = "Left";
    installPhase = ''
      ls -al
      runHook preInstall
      mkdir -p $out/{bin,libexec/${pname}}
      mv node_modules $out/libexec/${pname}/node_modules
      mv deps $out/libexec/${pname}/deps
      runHook postInstall
    '';

    distPhase = ''
      cd $out
      unlink "$out/libexec/Left/deps/Left/node_modules"
      ln -s "$out/libexec/Left/node_modules" "$out/libexec/Left/deps/Left/desktop/node_modules"
      ls -al
      ls -al libexec
      mkdir -p bin
      cd bin
      echo '#!/bin/sh' > left
      echo "cd $out/libexec/Left/deps/Left" >> left
      echo "${electron}/bin/electron $out/libexec/Left/deps/Left/desktop" >> left
      chmod 0755 $out/bin/left
      true
    '';

  }) {};

  orca = callPackage ({ pkgs, stdenv, electron_8, mkYarnPackage }: let
    electron = electron_8;
    rev = "d469077";
    sha256 = "0gj78akn0yi9mvg08gi3761bh0dh38bvd5fs7kz35vp8w9szb04s";
    src = pkgs.fetchFromGitHub {
      owner = "hundredrabbits";
      repo = "Orca";
      inherit rev sha256;
    };
  in mkYarnPackage rec {

    name = "orca-${rev}";
    inherit src;
    packageJSON = src + "/desktop/package.json";
    yarnLock = ./Orca.yarn.lock;

    buildInputs = [ electron ];

    pname = "Orca";
    installPhase = ''
      ls -al
      runHook preInstall
      mkdir -p $out/{bin,libexec/${pname}}
      mv node_modules $out/libexec/${pname}/node_modules
      mv deps $out/libexec/${pname}/deps
      runHook postInstall
    '';

    distPhase = ''
      cd $out
      unlink "$out/libexec/${pname}/deps/${pname}/node_modules"
      ln -s "$out/libexec/${pname}/node_modules" "$out/libexec/${pname}/deps/${pname}/desktop/node_modules"
      ls -al
      ls -al libexec
      mkdir -p bin
      cd bin
      echo '#!/bin/sh' > orca-osc
      echo "cd $out/libexec/${pname}/deps/${pname}" >> orca-osc
      echo "${electron}/bin/electron $out/libexec/${pname}/deps/${pname}/desktop" >> orca-osc
      chmod 0755 $out/bin/orca-osc
      true
    '';

  }) {};

  marabu = callPackage ({ pkgs, stdenv, electron, mkYarnPackage }: let
    rev      = "e22e203d97af2347c7130e7c4a9c62d4067d5a5a";
    sha256   = "1ynbz269i0hnd35q9jf36kq10lkr294x8719nq0m0f8wd6b5hhcv";
    src = pkgs.fetchFromGitHub {
      owner = "hundredrabbits";
      repo  = "Marabu";
      inherit rev sha256;
    };
  in mkYarnPackage rec {
    name = "marabu-${rev}";
    inherit src;
    packageJSON = ./Marabu.package.json;
    yarnLock = ./Marabu.yarn.lock;

    buildInputs = [ electron ];

    pname = "Marabu";
    installPhase = ''
      ls -al
      runHook preInstall
      mkdir -p $out/{bin,libexec/${pname}}
      mv node_modules $out/libexec/${pname}/node_modules
      mv deps $out/libexec/${pname}/deps
      runHook postInstall
    '';

    distPhase = ''
      cd $out
      unlink "$out/libexec/${pname}/deps/${pname}/node_modules"
      ln -s "$out/libexec/${pname}/node_modules" "$out/libexec/${pname}/deps/${pname}/desktop/node_modules"
      ls -al
      ls -al libexec
      mkdir -p bin
      cd bin
      echo '#!/bin/sh' > marabu
      echo "cd $out/libexec/${pname}/deps/${pname}" >> marabu
      echo "${electron}/bin/electron $out/libexec/${pname}/deps/${pname}/desktop" >> marabu
      chmod 0755 $out/bin/marabu
      true
    '';

  }) {};

  pilot = callPackage ({ pkgs, stdenv, electron_5, mkYarnPackage }: let
    electron = electron_5;
    rev      = "3a2afc0ca9d9d09b008de1410b7f08cad92036c6";
    sha256   = "1pd1zgsyfh83lvwnzmn4krnrp0m54aw10253ckjpqkz8j8va84j3";
    src = pkgs.fetchFromGitHub {
      owner = "hundredrabbits";
      repo  = "Pilot";
      inherit rev sha256;
    };
  in mkYarnPackage rec {
    name = "pilot-${rev}";
    inherit src;
    packageJSON = ./Pilot.package.json;
    yarnLock = ./Pilot.yarn.lock;

    buildInputs = [ electron ];

    pname = "Pilot";
    installPhase = ''
      ls -al
      runHook preInstall
      mkdir -p $out/{bin,libexec/${pname}}
      mv node_modules $out/libexec/${pname}/node_modules
      mv deps $out/libexec/${pname}/deps
      runHook postInstall
    '';

    distPhase = ''
      cd $out
      unlink "$out/libexec/${pname}/deps/${pname}/node_modules"
      ln -s "$out/libexec/${pname}/node_modules" "$out/libexec/${pname}/deps/${pname}/desktop/node_modules"
      ls -al
      ls -al libexec
      mkdir -p bin
      cd bin
      echo '#!/bin/sh' > pilot-osc
      echo "cd $out/libexec/${pname}/deps/${pname}" >> pilot-osc
      echo "${electron}/bin/electron $out/libexec/${pname}/deps/${pname}/desktop" >> pilot-osc
      chmod 0755 $out/bin/pilot-osc
      true
    '';

  }) {};

  ronin = callPackage ({ pkgs, stdenv, electron_8 }: let
    electron = electron_8;
    rev    = "e375668143f8f12b98fa81e3efe7bccae78ce432";
    sha256 = "19mh62fbs2rryrch32cb1jnwckzd731w4131qb921qwz949ygiqf";
    src = pkgs.fetchFromGitHub {
      owner = "hundredrabbits";
      repo = "Ronin";
      inherit rev sha256;
    };
  in stdenv.mkDerivation {
    name = "ronin-${rev}";
    inherit src;
    buildInputs = [ electron_8 ];
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/lib/ronin
      cp -r $src/* $out/lib/ronin
      echo '{"main":"main.js"}' > $out/lib/ronin/package.json
      cat ${./Ronin.main.js} > $out/lib/ronin/main.js

      mkdir -p $out/bin
      echo '#!/bin/sh' > $out/bin/ronin
      echo "${electron}/bin/electron $out/lib/ronin" >> $out/bin/ronin
      chmod +x $out/bin/ronin
    '';
  }) {};
    
})
