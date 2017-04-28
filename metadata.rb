name 'chef-knockd'
maintainer 'Luca Capanna'
maintainer_email 'luca.capanna9@gmail.com'
license 'gplv3'
description 'Installs/Configures chef-knockd'
long_description 'Installs/Configures chef-knockd'
version '0.0.2'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/CPTBarbaciccia/chef-knockd/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/CPTBarbaciccia/chef-knockd' if respond_to?(:source_url)

%w(centos).each do |os|
  supports os
end

%w(build-essential).each do |cb|
  depends cb
end
