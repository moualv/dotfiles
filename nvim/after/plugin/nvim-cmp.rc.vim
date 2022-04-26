lua <<EOF
  local cmp = require'cmp'
  
  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
    },
    documentation = {
      border = "rounded",
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        local luasnip = require('luasnip')
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s"
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        local luasnip = require('luasnip')
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s"
      }),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      })
    },
    sources = {
      { name = "nvim_lsp" }
    }
  });

EOF
