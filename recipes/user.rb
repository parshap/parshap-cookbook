NAME = "parshap"
HOME = "/home/#{NAME}"

def parshap_file(name, &block)
  cookbook_file name do
    owner NAME
    group NAME
    instance_eval(&block)
  end
end

def parshap_directory(name, &block)
  directory name do
    owner NAME
    group NAME
    instance_eval(&block)
  end
end

# Create user account
group NAME
user NAME do
  gid NAME
  supports :manage_home => true
  home HOME
  shell "/bin/zsh"
end

# Reload ohai data
(ohai "reload passwd" do
  action :reload
  plugin "passwd"
end).run_action(:reload)

# Create ~/.ssh
parshap_directory "#{HOME}/.ssh" do
  mode "0700"
  action :create
end

# Known hosts
parshap_file "#{HOME}/.ssh/known_hosts" do
  source "known_hosts"
  mode 0600
end

# Authorized keys
parshap_file "#{HOME}/.ssh/authorized_keys" do
  source "authorized_keys"
  mode 0600
end
