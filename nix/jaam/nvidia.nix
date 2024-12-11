{ pkgs, config, ... }:

{
  nixpkgs.config = {
    cudaSupport = true;
    allowUnfree = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;

    nvidia-container-toolkit.enable = true;

    nvidia = {
      open = true;

      nvidiaSettings = true;
      nvidiaPersistenced = true;

      powerManagement.enable = true;

      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  environment = {
    systemPackages = with pkgs.cudaPackages; [
      cudatoolkit
      cudnn
    ];

    variables = {
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:$LD_LIBRARY_PATH";
      CUDA_HOME = "/run/opengl-driver";
    };
  };
}
