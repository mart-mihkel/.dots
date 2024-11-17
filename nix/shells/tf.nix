{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    (python311.withPackages (python-pkgs: with python-pkgs; [
      scikit-learn
      tensorflow
      matplotlib
      plotnine
      seaborn
      pandas
      numpy
      scipy
    ]))
  ];
}
