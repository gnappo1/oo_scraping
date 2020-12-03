require_relative 'lib/oo_scraping/version'

Gem::Specification.new do |spec|
  spec.name          = "oo_scraping"
  spec.version       = OoScraping::VERSION
  spec.authors       = ["Matteo"]
  spec.email         = ["gnappo.1@live.it"]

  spec.summary       = "Write a short summary, because RubyGems requires one."
  spec.description   = "Write a longer description or delete this line."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")



  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'colorize'
  spec.add_development_dependency 'tty-table'
  spec.add_development_dependency 'rmagick'
  spec.add_development_dependency 'tco'
  spec.add_development_dependency 'catpix'
  
end
