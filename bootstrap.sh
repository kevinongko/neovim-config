# Variables
dir=~/projects/dotfiles                    # dotfiles directory
backup=~/projects/dotfiles/backup          # old dotfiles backup directory
files=".vimrc"                             # list of files/folders to symlink in homedir

# create backup in homedir
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p $backup
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to backup directory, then create symlinks
for file in $files; do
    if [ -f ~/$file ];
    then
        echo "Moving existing $file from ~ to $backup"
        mv ~/$file $backup
    else
        echo "$file not found, nothing to backup"
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
