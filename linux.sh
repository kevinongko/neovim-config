# Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".zshrc .vimrc"             # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    if [ -f ~/$file ];
    then
        echo "Moving existing $file from ~ to $olddir"
        mv ~/$file ~/dotfiles_old/
    else
        echo "$file not found, nothing to backup"
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# install vim-plug
read -r -p "Install vim-plug? [y/N] " response
case $response in
    [yY][eE][sS]|[yY])
        echo "installing vim-plug"
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "...done"
        ;;
    *)
esac

# install zsh
read -r -p "Install zsh? [y/N] " response
case $response in
    [yY][eE][sS]|[yY])
        echo "installing zsh"
        sudo apt-get install zsh
        echo "...done"
        ;;
    *)
esac

# install oh-my-zsh
read -r -p "Install oh-my-zsh? the installer will replace your current .zshrc [y/N] " response
case $response in
    [yY][eE][sS]|[yY])
        echo "installing oh-my-zsh"
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ;;
    *)
        echo "all done, move along"
        ;;
esac
