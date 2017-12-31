class profile::basicfiveprofile {

    # Insert implementation here:
    # A module to manage Apache and MySQL with 5 website and 5 databases.
    # eyaml for passwords

    class { 'mysql::server':
        root_password           => 'strongpassword',
        remove_default_accounts => true,
        databases   => {
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

    class { 'apache' : }

    apache::vhost { 'vhost1.example.com':
    port    => '80',
    docroot => '/var/www/vhost1',
    }

    apache::vhost { 'vhost2.example.com':
    port    => '80',
    docroot => '/var/www/vhost2',
    }

    apache::vhost { 'vhost3.example.com':
    port    => '80',
    docroot => '/var/www/vhost3',
    }

    apache::vhost { 'vhost4.example.com':
    port    => '80',
    docroot => '/var/www/vhost4',
    }

    apache::vhost { 'vhost5.example.com':
    port    => '80',
    docroot => '/var/www/vhost5',
    }

    # A module that creates a fact to return the current version of git installed.
    include gitversion

}
