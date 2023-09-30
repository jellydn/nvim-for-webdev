return {
  -- Custom formatters
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local null_ls_status_ok, null_ls = pcall(require, "null-ls")
      if not null_ls_status_ok then
        return
      end

      local b = null_ls.builtins

      local sources = {
        -- for tailwindcss
        b.formatting.rustywind.with({
          filetypes = { "html", "css", "javascriptreact", "typescriptreact", "svelte" },
        }),
        -- Lua
        b.formatting.stylua,
      }
      return {
        sources = sources,
      }
    end,
  },
}
