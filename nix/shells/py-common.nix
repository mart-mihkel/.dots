{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    packages = [
        (pkgs.python311.withPackages (python-pkgs: with python-pkgs; [
            scikit-learn
            tensorflow
            matplotlib
            notebook
            plotnine
            seaborn
            pandas
            numpy
            scipy
            keras
        ]))
    ];
}

