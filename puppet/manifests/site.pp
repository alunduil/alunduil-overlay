node holland-examples inherits holland-default {
  exec { 'holland use examples':
    command => 'echo app-backup/holland examples >> package.use',
    cwd => '/etc/portage',
    unless => 'grep "holland examples" package.use',
    path => [ '/bin', '/usr/bin' ],
  }

  Package['app-backup/holland'] {
    require +> [
      Exec['holland use examples'],
      ]
  }
}

node holland-pgdump inherits holland-default {
  exec { 'holland use -mysql':
    command => 'echo app-backup/holland -mysql >> package.use',
    cwd => '/etc/portage',
    unless => 'grep "holland -mysql" package.use',
    path => [ '/bin', '/usr/bin' ],
  }

  exec { 'holland use postgresql':
    command => 'echo app-backup/holland postgresql >> package.use',
    cwd => '/etc/portage',
    unless => 'grep "holland postgres" package.use',
    path => [ '/bin', '/usr/bin' ],
  }

  Package['app-backup/holland'] {
    require +> [
      Exec['holland use -mysql'],
      Exec['holland use postgresql'],
      ],
  }

  file { '/etc/holland/backupsets/default.conf':
    content => "
               [holland:backup]\n
               plugin = pgdump\n
               \n
               [pgdump]\n
               role = postgres\n
               \n
               [pgauth]\n
               username = postgres\n
               ",
    group => 'root',
    mode => 0644,
    owner => 'root',
    require => Package['app-backup/holland'],
  }
}

node holland-mysqldump inherits holland-default {
  exec { 'config mysql':
    command => 'yes password | emerge --config mysql',
    unless => 'test -d /var/lib/mysql/mysql',
    path => [ '/bin', '/usr/bin' ],
    require => Package['app-backup/holland'],
  }

  Package['app-backup/holland'] {
    before +> Exec['config mysql'],
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

node holland-default inherits default {
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
      Exec['eix-update'],
      ],
  }
}  

node default {
  exec { 'eix-update':
    path => [ '/bin', '/usr/bin' ],
  }
}
