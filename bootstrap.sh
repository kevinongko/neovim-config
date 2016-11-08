# Variables
dir=$(pwd)                                # this directory
config=~/.config/nvim/                    # config directory
files="init.vim"                          # list of files/folders to symlink in homedir

# change to the config directory
echo "$dir"
echo "Changing to the $config directory"
cd $config
echo "...done"

# move existing config file to backup directory, then create symlinks
for file in $files; do
    if [ -f $config/$file ];
    then
        echo "Delete existing config"
        rm -rf $config/$file
    else
        echo "$file not found, nothing to remove"
    fi
    echo "Creating symlink to $file in config directory."
    ln -s $dir/$file $config/$file
done
