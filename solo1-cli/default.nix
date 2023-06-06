{ pkgs ?  import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/9e71014edecba9d9c78531ebc2861e28c931ff6f.tar.gz";
    }) {}, lib ? pkgs.lib, buildPythonPackage ? pkgs.python39.pkgs.buildPythonPackage
, fetchFromGitHub ? pkgs.fetchFromGitHub
, pythonOlder ? pkgs.python39.pkgs.pythonOlder
, click ? pkgs.python39.pkgs.click
, cryptography ? pkgs.python39.pkgs.cryptography
, ecdsa ? pkgs.python39.pkgs.ecdsa
, fido2 ? pkgs.python39.pkgs.fido2
, intelhex ? pkgs.python39.pkgs.intelhex
, pyserial ? pkgs.python39.pkgs.pyserial
, pyusb ? pkgs.python39.pkgs.pyusb
, requests ? pkgs.python39.pkgs.requests
}:

buildPythonPackage rec {
  pname = "solo-python";
  version = "0.1.1";
  format = "flit";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "ghagl";
    repo = "solo1-cli";
    rev = "main";
    hash = "sha256-VUxXBYimPDu0XmABvz9OoNsGc09w0SPgvLVfjSw9b6c=";
  };

  propagatedBuildInputs = [
    click
    cryptography
    ecdsa
    fido2
    intelhex
    pyserial
    pyusb
    requests
  ];

  preBuild = ''
    export HOME=$TMPDIR
  '';

  pythonImportsCheck = [
    "solo"
    "solo.cli"
    "solo.commands"
    "solo.fido2"
    "solo.operations"
  ];

  meta = with lib; {
    description = "Python tool and library for SoloKeys Solo 1";
    homepage = "https://github.com/solokeys/solo1-cli";
    maintainers = with maintainers; [ wucke13 ];
    license = with licenses; [ asl20 mit ];
  };
}
