def gem_config(conf)
  conf.gembox 'full-core'

  conf.gem :github => 'Asmod4n/mruby-uri-parser', :checksum_hash => "96e15ac2a49b1dda2800c07509be7aad3c859e48"
  conf.gem :github => 'iij/mruby-io'
  conf.gem :github => 'iij/mruby-env'
  conf.gem :github => 'iij/mruby-dir'
  conf.gem :github => 'iij/mruby-digest'
  conf.gem :github => 'iij/mruby-process'
  conf.gem :github => 'iij/mruby-pack'
  conf.gem :github => 'iij/mruby-socket'
  conf.gem :github => 'mattn/mruby-json', :checksum_hash => "a3414856b3105bc6a68d8472f204d52931a7fd7d"
  conf.gem :github => 'mattn/mruby-onig-regexp'
  conf.gem :github => 'matsumoto-r/mruby-redis', :checksum_hash => "af40e42492c1a24ec88a15cd56eee9edc7e69788"
  # conf.gem :github => 'matsumoto-r/mruby-memcached'
  conf.gem :github => 'matsumoto-r/mruby-sleep'
  conf.gem :github => 'matsumoto-r/mruby-userdata'
  conf.gem :github => 'matsumoto-r/mruby-uname'
  conf.gem :github => 'matsumoto-r/mruby-mutex'
  conf.gem :github => 'matsumoto-r/mruby-localmemcache'
  conf.gem :github => 'qtkmz/mruby-hogun'

  # add Test module
  conf.gem :github => 'iij/mruby-mtest'

  # be sure to include this gem (the cli app)
  conf.gem File.expand_path(File.dirname(__FILE__))
end

MRuby::Build.new do |conf|
  toolchain :clang

  conf.enable_bintest
  conf.enable_debug
  conf.enable_test

  gem_config(conf)
end
