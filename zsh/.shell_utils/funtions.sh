# watch_file() {
#   if [ $# -eq 0 ]
#   then
#     printf("Usage:\n\twatch file_to_watch exec")
#     return 1
#   fi
#
#   local FileToWatch=$1
#   local Executable=$2
#   local Filter=$3
#   inotifywait -qme close_write $FileToWatch | while read -r file event
#   do
#     clear
#     if ninja 1> /tmp/return_log; then
#       if [ -z "$Filter"  ]; then
#         $Executable
#       else
#         $Executable --gtest_filter=$Filter
#       fi
#     else
#       cat /tmp/return_log
#     fi
#   done
# }

# function cl() {
#     DIR="$*";
#     # if no DIR given, go home
#     if [ $# -lt 1 ]; then
#       DIR=$HOME;
#     fi;
#
#     builtin cd "${DIR}" && \
#     # use your preferred ls command
#         ls -F --color=auto
# }

function enable-benchmark() {
  sudo cpupower frequency-set --governor performance
}

function disable-benchmark() {
  sudo cpupower frequency-set --governor powersave
}

function compress() {
  tar -zcvf $1.tar.gz $1
}

function mount-windows() {
  sudo mount /dev/sda4 /mnt/Windows
}

function watch-file() {
  if [ $# -eq 0 ]
  then
    echo "Usage:\n\twatch file_to_watch exec"
    return 1
  fi

  local FileToWatch=$1
  local Executable=$2
  local Filter=$3
  inotifywait -qme close_write $FileToWatch | while read -r file event
  do
    clear
    if ninja 1> /tmp/return_log; then
      if [ -z "$Filter"  ]; then
        $Executable
      else
        $Executable --gtest_filter=$Filter
      fi
    else
      cat /tmp/return_log
    fi
  done
}
