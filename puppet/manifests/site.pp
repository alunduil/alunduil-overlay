node /holland.*((mysql|lvm).*){2}/ inherits /holland.*/ {
  exec { 'holland use mysql':
    command => 'echo app-backup/holland mysql >> package.use',
    cwd => '/etc/portage',
    unless => 'grep "holland mysql" package.use',
    path => [ '/bin', '/usr/bin' ],
  }

  Package['app-backup/holland'] {
    require +> [
      Exec['holland use mysql'],
      ],
  }
}

node /holland.*/ inherits default {
  exec { 'keyword holland':
    command => 'echo app-backup/holland"*" ~amd64 >> package.accept_keywords',
    cwd => '/etc/portage',
    unless => 'grep holland package.accept_keywords',
    path => [ '/bin', '/usr/bin' ],
  }

  package { 'app-backup/holland':
    ensure => 'latest',
    require => [ 
      Exec['keyword holland'],
      Exec['eix-sync'],
      ],
    before => Exec['config mysql'],
  }

  exec { 'config mysql':
    command => 'yes password | emerge --config mysql',
    unless => 'test -d /var/lib/mysql/mysql',
    path => [ '/bin', '/usr/bin' ],
    require => Package['app-backup/holland'],
  }

  file { '/root/.my.cnf':
    content => "
               [client]\n
               user     = root\n
               password = password\n
               ",
    group => 'root',
    mode => 0600,
    owner => 'root',
  }

  service { 'mysql':
    ensure => 'running',
    hasrestart => true,
    require => Exec['config mysql'],
  }
}  

node default {
  exec { 'eix-sync':
    path => [ '/bin', '/usr/bin' ],
  }
}
