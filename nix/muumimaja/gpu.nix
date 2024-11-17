{ pkgs }:

{
  boot = { 
    initrd.kernelModules = [ "amdgpu" ];
    kernelParams = [ "amdgpu.exp_hw_support=1" ];
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs.rocmPackages; [ clr.icd ];
  };
}
