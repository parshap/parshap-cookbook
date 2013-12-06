HOME = "/home/parshap"

# Fix SmartOS terminal problem - zsh does not find screen-256color def
if platform?("smartos") then
  bash "copy screen-256color definition" do
    code <<-EOH
      cp /usr/share/lib/terminfo/s/screen-256color \
        /opt/local/share/lib/terminfo/s/
    EOH
  end
end

git "#{HOME}/.oh-my-zsh" do
  repository 'git://github.com/robbyrussell/oh-my-zsh.git'
  user "parshap"
  group "parshap"
  reference "master"
  action :sync
end
