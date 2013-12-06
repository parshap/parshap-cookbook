# @TODO Don't hardcode path to $HOME
HOME = "/home/parshap"
DOTFILES = "#{HOME}/dotfiles"

git DOTFILES do
  repository "git@github.com:parshap/dotfiles"
  reference "master"
  user "parshap"
  group "parshap"
  action :sync
end

bash "parshap dotfiles install" do
  code <<-EOH
    sudo -Hu parshap bash -c "
      cd #{DOTFILES} && make
    "
  EOH
end
