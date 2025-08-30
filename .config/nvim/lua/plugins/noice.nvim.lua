return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,   -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
      },
    })
  end
}
