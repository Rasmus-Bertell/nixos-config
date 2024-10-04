{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    mako
    libnotify
    tmuxinator
    fzf
    php
    php.packages.composer
    intelephense
    ripgrep
  ];

  environment.pathsToLink = [ "/share/zsh" ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "VictorMono" ]; })
  ];

  programs = {
    zsh.enable      = true;
    hyprland.enable = true;
    waybar.enable   = true;
    foot.enable     = true;
    firefox.enable  = true;
    tmux.enable     = true;
    git.enable      = true;
  };

  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.jack.enable = true;
  services.pipewire.alsa.enable = true;

  users.defaultUserShell = pkgs.zsh;
}
