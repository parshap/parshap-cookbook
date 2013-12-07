include_recipe "tmux"

# Remove default config that tmux cookbook installs
file "/etc/tmux.conf" do
  action :delete
end
