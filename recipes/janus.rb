HOME = "/home/parshap"
JANUS = "#{HOME}/.vim"

%w{curl vim vim-nox rake ruby-dev exuberant-ctags git-core}.each do |pkg|
  package pkg
end

bash "parshap janus install" do
  code <<-EOH
    sudo -Hu parshap bash -c "
      curl -Lo- http://bit.ly/janus-bootstrap | bash
    "
  EOH
  creates JANUS
end

bash "parshap janus update" do
  code <<-EOH
    sudo -Hu parshap bash -c "
      cd #{JANUS} &&
      rake
    "
  EOH
end