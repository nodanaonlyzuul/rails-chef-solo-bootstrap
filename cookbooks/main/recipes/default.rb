# This should live on your server here: /var/chef/cookbooks/main/recipes/default.rb

package "git-core"

user node[:user][:name] do
  password node[:user][:password]
  gid "admin"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end