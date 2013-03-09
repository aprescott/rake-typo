Gem::Specification.new do |s|
  s.name         = "rake-typo"
  s.version      = "0.1"
  s.authors      = ["Adam Prescott"]
  s.email        = ["adam@aprescott.com"]
  s.homepage     = "https://github.com/aprescott/rake-typo"
  s.summary      = "Get task suggestions when you mistype Rake tasks."
  s.description  = "Provides a list of possible tasks you might have meant when Rake can't find a task you're trying to run."
  s.files        = Dir["{lib/**/*,test/**/*}"] + %w[rake-typo.gemspec rakefile LICENSE Gemfile README.md]
  s.require_path = "lib"
  s.test_files   = Dir["test/*"]

  s.add_runtime_dependency("rake", ">= 0.8.7", "< 11.0.0")
  s.add_runtime_dependency("rubyfish", "~> 0.0.5")

  s.add_development_dependency("rspec", "~> 2.5")
end
