{ pkgs }:

{
    programs.neovim = {
        enable = true;
        vimAlias = true;
        extraPackages = with pkgs; [
            typescript-language-server
            lua-language-server
            rust-analyzer
            pyright

            prettierd
            stylua
        ];
    };
}
