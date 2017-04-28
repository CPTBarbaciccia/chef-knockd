#
# Cookbook:: chef-knockd
# Recipe:: knock.rb
#
# Copyright:: 2017,  Luca Capanna
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# foobar
foo = 'knock-server-0.5-7.el7.centos.x86_64.rpm'
bar = '/etc/knockd.conf'

# enable and start knockd service
service 'knockd' do
  action      :nothing
  subscribes  :enable, "rpm_package[#{foo}]", :immediately
  subscribes  :start, "template[#{bar}]", :immediately
end

# edit /etc/knockd.conf by template
template bar do
  source      'knockd.erb'
  mode        '0600'
  owner       'root'
  group       'root'
  action      :nothing
  variables ({
    logfile:    node['knockd']['config']['logfile'],
    interface:  node['knockd']['config']['interface'],
    sequence:   node['knockd']['config']['sequence'],
    start_cmd:  node['knockd']['config']['start_cmd'],
    stop_cmd:   node['knockd']['config']['stop_cmd'],
    seq_time:   node['knockd']['config']['seq_time'],
    cmd_time:   node['knockd']['config']['cmd_time'],
    tcpflags:   node['knockd']['config']['tcpflags']
    })
end

# delete knock default config
file bar do
  action      :nothing
end

# install knock-server
rpm_package foo do
  source      "/opt/#{foo}"
  action      :nothing
  notifies    :delete, "file[#{bar}]", :before
  notifies    :create, "template[#{bar}]", :immediately
end

# move knock rpm in opt
cookbook_file "/opt/#{foo}" do
  source      foo
  action      :create_if_missing
  notifies    :install, "rpm_package[#{foo}]", :immediately
end
