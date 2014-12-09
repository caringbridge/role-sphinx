default[:sphinx][:install_method] = 'rpm'
default[:sphinx][:rpm][:conf_path] = '/etc/sphinx'
default[:sphinx][:rpm][:name] = "sphinx-2.2.3-1.rhel6.x86_64.rpm"
default[:sphinx][:rpm][:base_url] = "http://sphinxsearch.com/files/"
default[:sphinx][:package][:name] = nil # depends on platform_family when not explicit
default[:sphinx][:package][:yum_repo] = 'yum-epel' # yum recipe or nil
