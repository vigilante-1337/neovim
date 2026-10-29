return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        config = function()
            require("onedarkpro").setup({
                options = {
                    transparency = true,               -- 1. Turned this TRUE to allow transparency
                    highlight_inactive_windows = false, -- 2. Stops the blue shift when changing focus
                    terminal_colors = true,
                    cursorline = true,
                },
                styles = {
                    sidebars = "transparent",           -- 3. Forces Neo-tree sidebar to be transparent
                    floats = "transparent",             -- 4. Forces floating windows to be transparent
                }
            })

            vim.cmd("colorscheme onedark_vivid")
            
            -- Core Editor Highlights (Active & Inactive)
            vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#abb2bf" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", fg = "#abb2bf" }) -- Stops main editor window blue tint

            -- Floating Windows
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "#abb2bf" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

            -- Neo-tree Highlights (Active & Inactive)
            vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
            vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })   -- Stops Neo-tree window blue tint
            vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "NONE", fg = "NONE" })
        end,
    },
}

