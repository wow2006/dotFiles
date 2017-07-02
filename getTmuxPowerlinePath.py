#!/usr/bin/env python3
from powerline.bindings.tmux import __file__

print(__file__[:__file__.rindex('/')+1] + 'powerline.conf')
