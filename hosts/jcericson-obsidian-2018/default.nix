{ config, options, pkgs, ... }:

{
  imports = [
    ../../system/common.nix
    ../../system/graphical/x.nix
    ../../system/graphical/nvidia-offload.nix
    ../../system/libinput.nix
    ../../system/steam.nix
    ../../../hardware-configuration.nix # Include the results of the hardware scan.
    <nixos-hardware/dell/xps/15-9550> # from the nixos-hardware repo
  ];

  networking = {
    hostName = "jcericson-obsidian-2018"; # Define your hostname.
    hostId = "2a5d5725";
  };

  environment.systemPackages = with pkgs; [
    fbterm # compensate for UHD
  ];


  hardware.nvidia.prime = {
    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:1:0:0";

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:0:2:0";
  };

  #virtualisation.virtualbox.host.enable = true;
  ##virtualisation.docker.enable = true;
  #users.groups.docker.members = [ "jcericson" ];

  #networking.firewall.allowedUDPPortRanges = [
  #  { from = 6112; to = 6119; }
  #];

  programs.adb.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09";
}
