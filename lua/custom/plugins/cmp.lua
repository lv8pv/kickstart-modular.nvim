-- This is not the original dam9000/kickstart-modular.nvim cmp.lua, but a
-- rewritten version by saphorous/kickstart-modular.nvim. I have changed it to
-- match the original bindings from kickstart
--
-- Reason for these switch is to enable more luasnip snippets.
return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    'L3MON4D3/LuaSnip', -- snippet engine
    'onsails/lspkind.nvim', -- vs-code like pictograms
    'rafamadriz/friendly-snippets', -- useful snippets
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    require('luasnip').filetype_extend('htmldjango', { 'html' })
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {
      -- /lv8pv
      vim.keymap.set({ 'i' }, '<C-K>', function()
        luasnip.expand()
      end, { silent = true }),
      vim.keymap.set({ 'i', 's' }, '<C-L>', function()
        luasnip.jump(1)
      end, { silent = true }),
      vim.keymap.set({ 'i', 's' }, '<C-J>', function()
        luasnip.jump(-1)
      end, { silent = true }),

      vim.keymap.set({ 'i', 's' }, '<C-E>', function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true }),
      -- lv8pv/
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
        { name = 'luasnip' }, -- snippets
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = '...',
        },
        expandable_indicator = true,
        fields = { 'abbr', 'kind', 'menu' },
      },
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
