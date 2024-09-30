{ config, pkgs, ... }:

{
  home.username = "rasmus";
  home.homeDirectory = "/home/rasmus";

  home.stateVersion = "24.05";

  home.packages = [];

  # Dotfiles not in XDG directories
  home.file = {};

  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh.enable = true;
  programs.zsh.loginExtra = "if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland
fi";

  services.mako.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;

      # User XDG directories
      desktop = "${config.home.homeDirectory}/documents";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/documents/downloads";
      music = "${config.home.homeDirectory}/media/music";
      pictures = "${config.home.homeDirectory}/media/pictures";
      videos = "${config.home.homeDirectory}/media/videos";

      # Disable templates and shared directories
      publicShare = null;
      templates = null;

      # Add extra XDG_PROJECTS_DIR
      extraConfig = {
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/projects";
      };
    };

    # Dotfiles
    # TODO: Use dotfiles repo for configs
    configFile = {
        foot.source = dotfiles/foot;
        nvim.source = dotfiles/nvim;
    };
  };
}
