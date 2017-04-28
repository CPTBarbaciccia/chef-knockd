#
# Cookbook:: chef-knockd
# Recipe:: default
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

iugin = 'download and install knock'
robe = default['knockd']['depends']

# install dependencies
include_recipe 'build-essential'

package robe do
  action    :install
  notifies  :run, "script[#{iugin}]", :immediately
end

# download and install knock
script iugin do
  interpreter 'bash'
  user 'root'
  cwd '/opt'
  code <<-EOH
    curl -O http://www.zeroflux.org/proj/knock/files/knock-0.7.tar.gz
    tar -zxf knock-0.7.tar.gz
    cd knock-0.7
    ./configure
    make
    make install
  EOH
end

#include_recipe 'chef-knockd::knock'
