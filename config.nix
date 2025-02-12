_: {
  imports = [
    ./plugins.nix
    ./keymaps.nix
  ];

  colorschemes.catppuccin.enable = true;
  globalOpts = {
    number = true;
    relativenumber = true;
    cursorline = true;
    shiftwidth = 2;
    termguicolors = true;
    undofile = true;
    tabstop = 4;
    expandtab = true;
  };
}
