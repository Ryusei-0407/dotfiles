local fn = vim.fn

local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen NeoVim...'
    vim.cmd [[ packadd packer.nvim ]]
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- colortheme
    use 'marko-cerovac/material.nvim'

    -- alpha
    use 'goolord/alpha-nvim'

    -- lualine
    use 'nvim-lualine/lualine.nvim'

    -- indent
    use 'lukas-reineke/indent-blankline.nvim'

    -- sandwitch
    use 'machakann/vim-sandwich'

    -- silicon
    use 'segeljakt/vim-silicon'

    -- block paste
    use 'Rasukarusan/vim-block-paste'

    -- select multi lines
    use 'Rasukarusan/nvim-select-multi-line'

    -- split window resize
    use 'simeji/winresizer'

    -- cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'saadparwaiz1/cmp_luasnip'

    -- snippet
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'tamago324/nlsp-settings.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Copilot
    use 'github/copilot.vim'

    -- Telescipe
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Accelerate j or k
    use {
        'PHSix/faster.nvim',
        event = { 'VimEnter *' },
        config = function()
            vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_gj)', { noremap=false, silent=true })
            vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_gk)', { noremap=false, silent=true })
        end
    }

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
