# https://collectd.org/wiki/index.php/Plugin:NFS
class collectd::plugin::nfs (
  $ensure           = present,
) {

  include collectd::params

  $conf_dir = $collectd::params::plugin_conf_dir

  file { 'nfs.conf':
    ensure    => $collectd::plugin::nfs::ensure,
    path      => "${conf_dir}/nfs.conf",
    mode      => '0644',
    owner     => 'root',
    group     => $collectd::params::root_group,
    content   => template('collectd/nfs.conf.erb'),
    notify    => Service['collectd'],
  }

}
