{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    gobject-introspection
    wrapGAppsHook
  ];
  buildInputs = with pkgs; [
    (python3.withPackages (ps: with ps; [
      pygobject3
      distro
      pyudev
      systemd
      packaging
    ]))
    glib
    gtk3
    acpica-tools
    fwupd # services.fwupd.enable = true; is needed in main conf. This is sort of redundant, but not
    json-glib
  ];
}
