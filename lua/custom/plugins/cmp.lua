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
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
        -- completeopt = 'menu,menuone,noinsert',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-n>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<C-y>'] = cmp.mapping.confirm { select = false },
        -- ['<CR>'] = cmp.mapping.confirm {
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- },
        -- LV8PV 2024-03-13
        -- REMOVED TO TEST IF THIS IS WHAT MAKE TAB SELECT FROM SUGGESTIONS WHEN
        -- I JUST WANT TO TAB OUT. AFTER FIRST TEST IT SEEMS TO FIX THE PROBLEM,
        -- BUT NEED TO CHECK IF THERE ARE CONSEQUENCES OTHER PLACES...
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_locally_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
        --  LV8PV/
        ['<C-l>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- snippets
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
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
