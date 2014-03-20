class website(
  $docroot = '/opt/web'
){
  include apache
  include apache::mod::php
  include mysql::server

  apache::vhost { $::fqdn:
    port    =>  '80',
    docroot => $docroot,
  }


class { 'mysql::bindings':
    php_enable => true,
}

class { 'wordpress':
    install_dir => $docroot,
}

}

