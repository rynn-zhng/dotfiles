return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      local full_header = {
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
        "                                                      ",
        "            ─────── rynn-zhng | OS-001 ───────        ",
      }

      local function animated_header()
        local index = 1
        local animated_lines = { unpack(full_header) }
        for i = 1, #animated_lines do
          animated_lines[i] = ""
        end

        local function step()
          if index <= #full_header then
            animated_lines[index] = full_header[index]
            dashboard.section.header.val = animated_lines
            pcall(vim.cmd, "redraw")
            index = index + 1
            vim.defer_fn(step, 80)
          end
        end

        vim.defer_fn(step, 50)
        return full_header
      end

      dashboard.section.header.val = animated_header()

      dashboard.section.buttons.val = {
        dashboard.button("f", "📂  Find File", ":Telescope find_files <CR>"),
        dashboard.button("r", "🕒  Recent Files", ":Telescope oldfiles <CR>"),
        dashboard.button("p", "📁  Projects", ":Telescope projects <CR>"),
        dashboard.button("s", "⚙️  Settings", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("c", "📜  Edit Config", ":e ~/.config/nvim/lua/plugins/alpha.lua <CR>"),
        dashboard.button("u", "⬆️  Update Plugins", ":Lazy sync <CR>"),
        dashboard.button("g", "🌱  Git Status", ":Telescope git_status <CR>"),
        dashboard.button("t", "📝  TODO & Issues", ":Telescope todo-comments <CR>"),
        dashboard.button("l", "📌  Restore Session", ":SessionLoad <CR>"),
        dashboard.button("q", "❌  Quit Neovim", ":qa<CR>"),
      }

      dashboard.opts.opts = {
        margin = 6,
        position = "center",
      }

      alpha.setup(dashboard.opts)
    end,
  },
}
