alias vim="nvim"
alias cpwd="pwd | xclip -selection clipboard"
alias qrenderdoc="/home/ahussein/Documents/sourceCode/cpp/Graphics/Others/renderdoc/build/Release/GNU/bin/qrenderdoc"
alias lt='ls --human-readable --size -l -S --classify'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
if [ -f "/etc/arch-release" ]; then
  alias list_unused_packages="pacman -Qtdq"
  alias remove_unused_packages="sudo pacman -Rns $(pacman -Qtdq)"
  alias list_packages_by_date="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n"
fi
alias benchmark-compare="python /home/ahussein/Documents/sourceCode/cpp/SideProjects/benchmark/tools/compare.py"
alias nsight="(cd /home/ahussein/.programs/NVIDIA-Nsight-Graphics-2020.3/host/linux-desktop-nomad-x64; ./ngfx-ui &)"

