# https://collectd.org/wiki/index.php/Plugin:vmem
class collectd::plugin::vmem (
  $ensure           = present,
  $verbose          = false,
) {

  include collectd::params

  $conf_dir = $collectd::params::plugin_conf_dir
  validate_bool($verbose)

  file { 'vmem.conf':
    ensure    => $collectd::plugin::vmem::ensure,
    path      => "${conf_dir}/vmem.conf",
    mode      => '0644',
    owner     => 'root',
    group     => $collectd::params::root_group,
    content   => template('collectd/vmem.conf.erb'),
    notify    => Service['collectd'],
  }

}
