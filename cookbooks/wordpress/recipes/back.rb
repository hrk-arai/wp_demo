#
# mysql settings
#
# see https://docs.chef.io/resources.html#multiple-packages
package "mysql-server" do
  action :install
end

# see https://docs.chef.io/resources.html#cookbook-file
cookbook_file "/etc/my.cnf" do
  mode "0755"
  action :create
  notifies :restart, "service[mysqld]", :immediately
end

# see https://docs.chef.io/resources.html#service
service "mysqld" do
  action [ :enable, :start ]
end

# see https://docs.chef.io/resources.html#execute
execute "create-db" do
  command "mysql < /tmp/create-wordpress.sql"
  action :nothing
end

# see https://docs.chef.io/resources.html#template
template "/tmp/create-wordpress.sql" do
  source "create-wordpress.sql.erb"
  action :create
  notifies :run, "execute[create-db]", :immediately
end
