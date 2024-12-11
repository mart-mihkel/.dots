{
  users.users.kubujuss = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  services.getty.autologinUser = "kubujuss";
}
