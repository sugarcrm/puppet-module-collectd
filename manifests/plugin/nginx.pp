# https://collectd.org/wiki/index.php/Plugin:nginx
class collectd::plugin::nginx (
  $url        = 'http://localhost/nginx_status',
  $ensure     = present,
  $user       = undef,
  $password   = undef,
  $verifypeer = undef,
  $verifyhost = undef,
  $cacert     = undef,
  $interval   = undef,
) {

  if $::osfamily == 'Redhat' {
    package { 'collectd-nginx':
      ensure => $ensure,
    }
  }

  collectd::plugin {'nginx':
    ensure   => $ensure,
    content  => template('collectd/plugin/nginx.conf.erb'),
    interval => $interval,
  }
}
