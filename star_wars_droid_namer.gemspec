Gem::Specification.new do |s|
  s.name        = "star_wars_droid_namer"
  s.version     = "1.0.0"
  s.summary     = "Star Wars Droid Namer"
  s.description = "A simple gem to allow generation of random droid names given some inputs"
  s.authors     = ["hairywookster@gmail.com"]
  s.email       = "hairywookster@gmail.com"
  s.files       = ["lib/star_wars_droid_namer.rb",
                   "lib/star_wars_droid_namer_cli.rb",
                   "lib/star_wars_droid_namer/api.rb",
                   "lib/star_wars_droid_namer/droid_name.rb"]
  s.executables = [ "star_wars_droid_namer" ]
  s.homepage    = "https://github.com/hairywookster/star-wars-droid-namer"
  s.license     = "MIT"
end
