# Variables
dir=$(pwd)                                # this directory
config=~/.config/nvim/                    # config directory
file=init.vim                             # file to symlink

# Check if directory exist
if [[ ! -e $config ]]; then
    echo "Creating configuration directory"
    mkdir -p $config
fi

# Change to the config directory
echo "Changing to the $config directory"
cd $config

# Check if vim plug downloaded
if [ ! -f $config/autoload/plug.vim ]; then
    echo "Installing vim plug"
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Delete existing config if exist
if [ -f $config/$file ]; then
    echo "Delete existing config"
    rm -rf $config/$file
fi

# Make symlink
echo "Creating symlink to $file in config directory."
ln -s $dir/$file $config/$file
