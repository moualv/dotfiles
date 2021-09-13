lua << EOF

function eslint()
  return {
    exe = "eslint_d",
    args = { '--stdin', '--stdin-filename', vim.api.nvim_buf_get_name(0), '--fix-to-stdout' },
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    typescript = {eslint},
    typescriptreact = {eslint},
  }
})


vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx FormatWrite
augroup END
]], true)

EOF

