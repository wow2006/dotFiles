return {
  'mrtazz/DoxygenToolkit.vim',
  lazy=true,
  config = function()
    g["g:load_doxygen_syntax"] = 3
    g.DoxygenToolkit_authorName="Ahmed Abd El-Aal <eng.ahmedhussein89@gmail.com>"
    g.DoxygenToolkit_interCommentTag = "* "
    g.DoxygenToolkit_interCommentBlock = "* "
    g.DoxygenToolkit_cinoptions = "c0C1"
  end
}
