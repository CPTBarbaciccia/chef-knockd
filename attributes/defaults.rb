#
# Cookbook:: chef-knockd
# Attibutes:: defaults
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
#
# Description:: Attributes for chef-knockd cookbook

#some base attributes
case node['platform']
when 'ubuntu'
  default['knockd']['depends'] = 'libpcap-dev'
when 'centos'
  default['knockd']['depends'] = 'libpcap-devel'
end

# attributes for knockd
default['knockd']['config']['logfile'] = '/var/log/knockd.log'
default['knockd']['config']['interface'] = 'eth0'
default['knockd']['config']['sequence'] = '2222,3333,4444'
default['knockd']['config']['start_cmd'] = '/sbin/iptables -I INPUT 1 -m state --state NEW,ESTABLISHED,RELATED -s %IP% -p tcp --dport ssh -j ACCEPT'
default['knockd']['config']['seq_time'] = 15
default['knockd']['config']['cmd_time'] = 20
default['knockd']['config']['tcpflags'] = 'syn'

# ping here
default['knockd']['config']['stop_cmd'] = '/sbin/iptables -D INPUT -m state --state NEW,ESTABLISHED,RELATED -s %IP% -p tcp --dport ssh -j ACCEPT'
