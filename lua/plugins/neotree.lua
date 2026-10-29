return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      -- Your custom configurations go here
    })

    -- Auto-start Neo-tree on launch
    vim.api.nvim_create_autocmd("VimEnter", {
      desc = "Open Neo-tree on startup",
      callback = function()
        -- Avoid opening if Neovim was started with a file argument (e.g., nvim main.lua)
        -- If you want it to open even when opening a file, remove the `argv` check line below.
        if vim.fn.argc() > 0 then return end

        -- Avoid opening in specific filetypes like Git commits or diffs
        local exclude_ft = { "gitcommit", "gitrebase", "diff" }
        if vim.tbl_contains(exclude_ft, vim.bo.filetype) then return end

        -- Open Neo-tree close to the left side
        vim.cmd("Neotree focus")
      end,
    })
  end,
}

