Gem::Specification.new do |spec|
  spec.name        = "rankum"
  spec.version     = "0.0.3"

  spec.author      = "Felipe Besson"
  spec.email       = "flpbesson@gmail.com"
  spec.date        = "2016-04-22"
  spec.summary     = "Measure search rank quality"
  spec.description = "A gem to compare search ranks using flexible quality rank metrics"
  spec.homepage    = "https://github.com/besson/rankum"
  spec.license     = "MIT"

  spec.files       = `git ls-files`.split("\n")
  spec.test_files  = spec.files.grep(/^spec/)
  spec.executables = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }

  spec.add_dependency("interactor", "~> 3.1")
  spec.add_dependency("mixlib-cli", "~> 1.5")
  spec.add_dependency("paint", "~> 1.0")
end
