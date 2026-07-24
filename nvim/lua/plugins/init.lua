return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    'stevearc/oil.nvim'
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup(
        {
          chunk = {
            enable = true,
            priority = 15,
            style = {
              { fg = "#806d9c" },
              { fg = "#c21f30" },
            },
            use_treesitter = true,
            chars = {
              horizontal_line = "─",
              vertical_line = "│",
              left_top = "╭",
              left_bottom = "╰",
              right_arrow = ">",
            },
            textobject = "",
            max_file_size = 1024 * 1024,
            error_sign = true,
            -- animation related
            duration = 100,
            delay = 200,
          },

          indent = {
            enable = false
          }
        }
      )
    end
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },
  {
    "echasnovski/mini.animate"
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", { silent = true } },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {'<leader>ff', '<cmd>Telescope find_files<cr>', desc = "Find files"},
      {'<C-p>', '<cmd>Telescope git_files<cr>', desc = "Find git files"},
      {'<leader>fg', '<cmd>Telescope live_grep<cr>', desc = "Grep files"},
      {'<leader>fb', '<cmd>Telescope buffers shorten_path=true<cr>', desc = "Search open buffers"},
    },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = {
            "smart"
          },
        },
      })
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        --"csharp-language-server",
        --"omnisharp",
        "xmlformatter",
        "stylua",
        "bicep-lsp",
        "html-lsp",
        "css-lsp",
        "csharpier",
        "prettier",
        "json-lsp",
        "eslint-lsp",
        "typescript-language-server",
        "rust-analyzer",
        "pyright",

        -- !
        "roslyn",
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    ft = { "cs", "razor" },
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      auto_install = true,
      ensure_installed = { "c", "css", "bicep", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "c_sharp", "groovy", "python", "java", "typescript", "kotlin" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = {
        enable = true,
        disable = { "python", "ruby" },
      },
      fold = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["]a"] = "@parameter.inner",
          },
          swap_previous = {
            ["[a"] = "@parameter.inner",
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
          include_surrounding_whitespace = true,
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {"<leader>xq", "<cmd>TroubleToggle quickfix<cr>"}
    }
  },
  {
    "mbbill/undotree",
    keys = {
      {"<leader>u", vim.cmd.UndotreeToggle}
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  {
    -- Debug Framework
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.nvim-dap"
    end,
    event = "VeryLazy",
  },
  { "nvim-neotest/nvim-nio" },
  {
    -- UI for debugging
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "configs.nvim-dap-ui"
    end,
  },
  {
    "nvim-neotest/neotest",
    requires = {
      {
        "Issafalcon/neotest-dotnet",
      }
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "Issafalcon/neotest-dotnet",
    lazy = false,
    dependencies = {
      "nvim-neotest/neotest"
    }
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 60
      }
    }
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      require("diffview").setup()
    end
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = {
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianSearch",
      "ObsidianNew",
      "ObsidianTemplate",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        { name = "vault", path = "~/Obsidian/Vault" },
      },
      daily_notes = {
        folder = "Journal",
        template = "daily",
      },
      templates = {
        folder = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {
          day_name = function() return os.date("%A") end,
          week = function() return os.date("Week %W — %Y") end,
          month = function() return os.date("%B %Y") end,
        },
      },
      new_notes_location = "current_dir",
      ui = {
        enable = false,
      },
    },
    keys = {
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Today's daily note" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's daily note" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search vault" },
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
      { "<leader>ot", function() vim.bo.modifiable = true; vim.cmd("ObsidianTemplate") end, desc = "Insert template" },
      { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Show links" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show backlinks" },
      {
        "<leader>ow",
        function()
          local vault = vim.fn.expand("~/Obsidian/Vault")
          local name = os.date("Week %W — %Y")
          local path = vault .. "/Weekly/" .. name .. ".md"
          vim.cmd("edit " .. vim.fn.fnameescape(path))
          if vim.fn.filereadable(path) == 0 or vim.fn.getfsize(path) <= 0 then
            vim.bo.modifiable = true
            vim.cmd("ObsidianTemplate weekly")
          end
        end,
        desc = "Weekly note",
      },
      {
        "<leader>om",
        function()
          local vault = vim.fn.expand("~/Obsidian/Vault")
          local name = os.date("%B %Y")
          local path = vault .. "/Monthly/" .. name .. ".md"
          vim.cmd("edit " .. vim.fn.fnameescape(path))
          if vim.fn.filereadable(path) == 0 or vim.fn.getfsize(path) <= 0 then
            vim.bo.modifiable = true
            vim.cmd("ObsidianTemplate monthly")
          end
        end,
        desc = "Monthly note",
      },
    },
  },
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      provider = "claude-code",
      acp_providers = {
        ["claude-code"] = {
          command = "npx",
          args = { "-y", "-g", "@agentclientprotocol/claude-agent-acp" },
          env = {
            HOME = os.getenv("HOME"),
            NODE_NO_WARNINGS = "1",
            ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
            ANTHROPIC_BASE_URL = os.getenv("ANTHROPIC_BASE_URL"),
            ACP_PATH_TO_CLAUDE_CODE_EXECUTABLE = vim.fn.exepath("claude") ~= "" and vim.fn.exepath("claude") or "/Users/f.lecuyer/.local/bin/claude",
            ACP_PERMISSION_MODE = "bypassPermissions",
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "sotte/presenting.nvim",
    opts = {
      -- fill in your options here
      -- see :help Presenting.config
    },
    cmd = { "Presenting" },
  }
}
