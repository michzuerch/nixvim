{ pkgs, ... }:
{
  extraConfigLua = ''
    require("avante").setup({
      provider = "claude",
    })
  '';

  extraPlugins = with pkgs; [
    vimPlugins.nvim-web-devicons
    vimPlugins.avante-nvim
    {
      plugin = vimPlugins.render-markdown-nvim;
      config = ''
        :lua require("render-markdown").setup({file_types = { "markdown", "Avante" }})
      '';
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "co";
      action = ":AvanteConflictChooseOurs";
    }
    {
      mode = "n";
      key = "ct";
      action = ":AvanteConflictChooseTheirs";
    }
    {
      mode = "n";
      key = "cb";
      action = ":AvanteConflictChooseBooth";
    }
    {
      mode = "n";
      key = "cc";
      action = ":AvanteConflictChooseCursor";
    }
    {
      mode = "n";
      key = "c0";
      action = ":AvanteConflictChooseNone";
    }
    {
      mode = "n";
      key = "[x";
      action = ":AvanteConflictNextConflict";
    }
    {
      mode = "n";
      key = "]x";
      action = ":AvanteConflictPreviousConflict";
    }
  ];
}
