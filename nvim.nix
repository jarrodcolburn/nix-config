{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvf.log";
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        lsp.enable = true;

        languages = {
          enableTreesitter = true;
          enableFormat = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          markdown.enable = true;
          bash.enable = true;
          
          # Rust
          rust = {
            enable = true;
            extensions.crates-nvim.enable = true;
          };

          # Web
          ts.enable = true; # TypeScript/JavaScript
          html.enable = true;
          css.enable = true;
          
          # Python
          python.enable = true;
        };

        # UI & UX
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        filetree.neo-tree.enable = true;
        
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false; # throws an annoying debug message
        };
        
        dashboard = {
          dashboard-nvim.enable = false;
          alpha.enable = true;
        };

        notify = {
          nvim-notify.enable = true;
        };
        
        utility = {
          motion = {
            leap.enable = true;
            precognition.enable = false;
          };
          
          images = {
             image-nvim.enable = false;
          };
        };
        
        notes = {
           todo-comments.enable = true;
        };

        terminal = {
          toggleterm = {
             enable = true;
             lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # broken on some versions
          fastaction.enable = true;
        };
      };
    };
  };
}
