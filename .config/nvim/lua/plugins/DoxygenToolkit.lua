return {
  'mrtazz/DoxygenToolkit.vim',
  lazy = true,
  config = function()
    vim.g.load_doxygen_syntax          = 1
    vim.g.DoxygenToolkit_authorName    = "Ahmed Abd El-Aal <eng.ahmedhussein89@gmail.com>"
    vim.g.DoxygenToolkit_interCommentTag   = "* "
    vim.g.DoxygenToolkit_interCommentBlock = "* "
    vim.g.DoxygenToolkit_cinoptions    = "c0C1"
  end,
}
