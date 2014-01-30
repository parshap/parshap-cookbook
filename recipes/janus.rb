HOME = "/home/parshap"
JANUS = "#{HOME}/.vim"

git JANUS do
  repository "git@github.com:carlhuda/janus.git"
  reference "master"
  user "parshap"
  group "parshap"
  action :sync
end


bash "parshap janus update" do
  code <<-EOH
    sudo -Hu parshap bash -c "
      cd #{JANUS} &&
      rake
    "
  EOH
end
