# 1. .local ie. powerline
LOCAL_BIN=$HOME/.local/bin
# 2. vim-superman ie. vman
VMAN_BIN=$HOME/.local/share/nvim/plugged/vim-superman/bin
# 3. Ruby
RUBY=$HOME/.gem/ruby/2.7.0/bin
# Append PATH
export PATH=$LOCAL_BIN:$VMAN_BIN:$RUBY:${PATH}

export DICOM_VIEWER=/mnt/Windows/Hard/SourceCode/DicomViewer/

