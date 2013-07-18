# @TODO Don't hardcode path to $HOME
HOME = "/home/parshap"
DOTFILES = "#{HOME}/dotfiles"

# Clone repository, assumes we have private key
bash "parshap dotfiles clone" do
  code <<-EOH
    sudo -Hu parshap git clone git@github.com:parshap/dotfiles.git #{DOTFILES}
  EOH
  creates DOTFILES
end

bash "parshap dotfiles update" do
  code <<-EOH
    sudo -Hu parshap bash -c "
      cd #{DOTFILES} &&
      git fetch origin &&
      git checkout -fB master origin/master &&
      make
    "
  EOH
end
