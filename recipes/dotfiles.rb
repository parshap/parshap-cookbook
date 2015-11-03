# @TODO Don't hardcode path to $HOME
HOME = "/home/parshap"
DOTFILES = "#{HOME}/dotfiles"

git DOTFILES do
  repository "git@github.com:parshap/dotfiles"
  reference "master"
  action :sync
end

bash "parshap dotfiles install" do
  code <<-EOH
    chown -R parshap:parshap #{DOTFILES}
    sudo -Hu parshap bash -c "
      cd #{DOTFILES} && make
    "
  EOH
end
