return {
  'junegunn/vim-easy-align',
  lazy=false,
  config = function()
    local cmd = vim.cmd
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    cmd('xmap ga <Plug>(EasyAlign)')
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    cmd('nmap ga <Plug>(EasyAlign)')
  end
}
