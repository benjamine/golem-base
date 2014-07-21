group { "puppet":
    ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
    content => template('/vagrant/resources/banner.erb')
}

package { 'dos2unix':
    ensure => 'installed'
}

file { '/vagrant/scripts/zsh.sh':
    ensure => present,
    mode => '0755'
}

exec { 'zsh':
    command => "/vagrant/scripts/zsh.sh",
    user => "vagrant",
    logoutput => on_failure,
    require => File['/vagrant/scripts/zsh.sh']
}

file { '/vagrant/scripts/docker.sh':
    ensure => present,
    mode => '0755'
}

exec { 'docker':
    command => "/vagrant/scripts/docker.sh",
    logoutput => on_failure,
    require => File['/vagrant/scripts/docker.sh']
}
