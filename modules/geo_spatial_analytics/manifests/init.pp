class geo_spatial_analytics {

    exec { 'bundle exec rake':
      cwd     => '/home/vagrant/geo_spatial_analytics',
      path    => ['/usr/bin', '/usr/sbin'],
      require => Exec['install_dependencies'],
    }

    exec { 'install_dependencies':
        command => 'bundle install  --path /tmp/.bundle',
        cwd     => '/home/vagrant/geo_spatial_analytics',
        path    => ['/usr/bin', '/usr/sbin'],
        require => [File['geo-spatial-analytics-project-directory'], Class['ruby']],
    }

    file { 'geo-spatial-analytics-project-directory':
        ensure => 'directory',
        path   => '/home/vagrant/geo_spatial_analytics',
    }
}