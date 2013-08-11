node /holland.*/ inherits default {
  package { 'app-backup/holland':
    ensure => 'latest',
    require => Exec['keyword holland'],
  }

  exec { 'keyword holland':
    command => 'echo app-backup/holland ~amd64 >> package.accept_keywords',
    cwd => '/etc/portage',
    unless => 'grep holland package.accept_keywords',
    path => [ '/bin', '/usr/bin' ],
  }
}  

node default {
}
