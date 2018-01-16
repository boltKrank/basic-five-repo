class profile::basicfiveprofile (
  String $rootpassword = lookup('profile::basicfiveprofile::rootpassword', 'strongpassword'),
  Array $vhosts = lookup('profile::basicfiveprofile::vhosts', ['vhost1','vhost2']),
){
  class { '::mysql::server':
    root_password           => $rootpassword,
    remove_default_accounts => true,
    override_options        => $override_options,
    databases               => {  
    'db1'  => {
        ensure  => 'present',
        charset => 'utf8',
      },
      'db2'  => {
        ensure  => 'present',
        charset => 'utf8',
      },
      'db3'  => {
        ensure  => 'present',
        charset => 'utf8',
      },
      'db4'  => {
        ensure  => 'present',
        charset => 'utf8',
      },
      'db5'  => {
        ensure  => 'present',
        charset => 'utf8',
      },
    }

  }
  
  include apache

  $vhosts = ['vhost1','vhost2','vhost3','vhost4','vhost5']

  $vhosts.each |String $vhost| {
    apache::vhost { $vhost:
      port    => '80',
      docroot => "/var/www/${vhost}",
  }

    # Insert implementation here:
    # A module to manage Apache and MySQL with 5 website and 5 databases.
    # eyaml for passwords

    # A module that creates a fact to return the current version of git installed.
    include gitversion

}
