# install kitty and zsh
sudo pacman -S kitty zsh zsh-autosuggestions zsh-syntax-highlighting

# install oh-my-zsh and powerlevel10k for customization of kitty. Also pokemon
yay -S oh-my-zsh-git zsh-theme-powerlevel10k pokemon-colorscripts-git

# clone oh-my-zsh plugins into their proper place
git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color # zsh-256color
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting # zsh-syntax-highlighting
