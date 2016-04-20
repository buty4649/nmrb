MRuby::Gem::Specification.new('nmrb') do |spec|
  spec.license = 'MIT'
  spec.author  = 'buty4649'
  spec.summary = 'nmrb'
  spec.bins    = ['nmrb']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end
