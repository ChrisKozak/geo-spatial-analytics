class post_gis {
    exec { 'restart_postgres':
        command => '/usr/bin/touch /etc/postgresql/8.4/main/pg_hba.conf',
        require => Service['postgresql-8.4'],
    }

    service { 'postgresql-8.4':
        ensure    => 'running',
        subscribe => File['host_auth_file'],
        enable    => true,
        require   => Package['opengeo-postgis'],
    }

    file { 'host_auth_file':
        ensure  => 'file',
        path    => '/etc/postgresql/8.4/main/pg_hba.conf',
        require => Package['opengeo-postgis'],
    }

    file { '/etc/postgresql/8.4/main/pg_hba.conf.orig':
        ensure  => 'absent',
        require => Package['opengeo-postgis'],
    }

    package { ['opengeo-postgis', 'gdal-bin']:
      ensure  => present,
      require => Exec['apt-get update'],
    }

    exec { 'apt-get update':
        command => '/usr/bin/apt-get update',
        require => [File['opengeo.list']],
    }

    file { 'opengeo.list':
        ensure  => present,
        path    => '/etc/apt/sources.list.d/opengeo.list',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        replace => false,
        content => 'deb http://apt.opengeo.org/ubuntu lucid main',
        require => Exec['opengeo_repokey'],
    }

    exec { 'opengeo_repokey':
        command => 'wget -qO- http://apt.opengeo.org/gpg.key | apt-key add -',
        path    => '/usr/local/bin/:/bin/:/usr/bin/',
    }
}