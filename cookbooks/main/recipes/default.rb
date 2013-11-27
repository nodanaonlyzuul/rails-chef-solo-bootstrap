# This should live on your server here: /var/chef/cookbooks/main/recipes/default.rb

package "git-core"
package "redis-server"
include_recipe "imagemagick::rmagick"

user node[:user][:name] do
  password node[:user][:password]
  gid "sudo"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end