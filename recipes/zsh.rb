HOME = "/home/parshap"

git "#{HOME}/.oh-my-zsh" do
  repository 'git://github.com/robbyrussell/oh-my-zsh.git'
  user "parshap"
  group "parshap"
  reference "master"
  action :sync
end
