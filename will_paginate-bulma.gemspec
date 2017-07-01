# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bulma_pagination/version"

Gem::Specification.new do |s|
  s.name        = "will_paginate-bulma"
  s.version     = BulmaPagination::VERSION
  s.authors     = ["Paul Hoffer"]
  s.email       = ["git@paulhoffer.com"]
  s.homepage    = "https://github.com/phoffer/will_paginate-bulma"
  s.summary     = %q{Integrates the Bulma pagination component with will_paginate}
  s.description = %q{This gem integrates the Bulma pagination component with the will_paginate pagination gem. Supports Hanami, Sinatra, and Rails}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "will_paginate", ">= 3.0.3"
end
