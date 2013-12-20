# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
data = File.expand_path('../data', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tsukiko/version'

Gem::Specification.new do |gem|
  gem.name          = "tsukiko"
  gem.version       = Tsukiko::VERSION
  gem.authors       = ["gyorou"]
  gem.email         = ["gyorou@tjjtds.com"]
  gem.description   = %q{a tool to convert simplified Chinsese into tradtional Chinese}
  gem.summary       = %q{a tool to convert simplified Chinsese into tradtional Chinese}
  gem.homepage      = ""

  gem.files         = ["lib/tsukiko.rb","data/bigram.data","data/cn_tw.data","data/words.data"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib","data"]
end
