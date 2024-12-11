{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    tmux 
    curl 
    wget 
    git 
    vim 
  ];
}
