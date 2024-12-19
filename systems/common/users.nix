{
  users = {
    groups = {
      seire = {};
    };

    users = {
      kubujuss = {
        createHome = true;
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" ];
      };

      seire = {
        createHome = true;
        home = "/var/seire";
        isNormalUser = true;
        group = "seire";
      };
    };
  };

  services.getty.autologinUser = "seire";
}
