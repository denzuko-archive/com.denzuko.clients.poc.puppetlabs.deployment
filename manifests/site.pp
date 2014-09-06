package { "ruby": ensure => present }
package { 'ruby-bundler': ensure => 'installed' }
package { 'ruby-dev': ensure => 'installed' }
package { 'librarian-puppet': ensure => 'installed' }
package { 'wget': ensure => 'installed' }
package { 'git-core': ensure => 'installed' }
package { 'puppet': ensure => 'installed', provider => 'gem' }
package { 'foreman': ensure => 'installed', provider => 'gem' }

class { 'nginx': 
        mail => false,
        worker_processes => 2,
        manage_repo => true,
        confd_purge => true,
        vhost_purge => true,
}

nginx::resource::vhost { 'default':
	ensure		=> present,
	listen_port	=> 8080,
	ssl 		=> false,
	www_root	=> "/var/www/default",
	server_name     => ["localhost", "$hostname", "$fqdn"]}

vcsrepo { "/var/www/default":
	ensure		=> present,
	provider	=> git,
	revision	=> 'master',
	source		=> "https://github.com/puppetlabs/exercise-webpage.git"}

