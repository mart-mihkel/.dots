{ pkgs, config, ... }:

{
  nixpkgs.config.cudaSupport = true;

  hardware = {
    graphics.enable = true;
    nvidia-container-toolkit.enable = true;

    nvidia = {
      open = false;
      nvidiaSettings = true;
      nvidiaPersistenced = true;
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  environment.systemPackages = with pkgs.cudaPackages; [ 
    cudatoolkit
    cudnn
  ];

  virtualisation.docker = {
    extraPackages = with pkgs; [ nvidia-container-toolkit ];
  };
}
