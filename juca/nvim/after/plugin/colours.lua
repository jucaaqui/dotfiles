function ColourMyPencils(colour)

    colour = colour or "kanagawa"
    vim.cmd.colorscheme(colour)

    vim.api.nvim_set_hl(0, "Normal",                { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat",           { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC",              { bg = "none" })

    vim.api.nvim_set_hl(0, "SignColumn",            { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr",                { bg = "none" }) 
    vim.api.nvim_set_hl(0, "Folded",                { bg = "none" })
    vim.api.nvim_set_hl(0, "NonText",               { bg = "none" })
    vim.api.nvim_set_hl(0, "SpecialKey",            { bg = "none" })
    vim.api.nvim_set_hl(0, "VertSplit",             { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer",           { bg = "none" })
    
    vim.api.nvim_set_hl(0, "FloatBorder",           { bg = "none" })

    vim.api.nvim_set_hl(0, "TelescopeBorder"      , { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal"      , { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle" , { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeSelection"   , { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewLine" , { bg = "none" })
end

ColourMyPencils()

