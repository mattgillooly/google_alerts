Gem::Specification.new do |s|
  s.name        = 'google_alerts'
  s.version     = '0.0.0'
  s.date        = '2012-06-24'
  s.summary     = "Parse Google Alerts emails"
  s.description = "A parser for Google Alerts emails"
  s.authors     = ["Matt Gillooly"]
  s.email       = 'matt@mattgillooly.com'

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.homepage    = 'http://mattgillooly.github.com/google_alerts'

  s.add_dependency 'nokogiri'
  s.add_dependency 'rspec'
  s.add_dependency 'rake'
end
