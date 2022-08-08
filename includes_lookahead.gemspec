require_relative "lib/includes_lookahead/version"

Gem::Specification.new do |spec|
  spec.name        = "includes_lookahead"
  spec.version     = IncludesLookahead::VERSION
  spec.authors     = ["Daniel Bryant"]
  spec.email       = ["bryant.daniel.j@gmail.com"]
  spec.homepage    = "https://github.com/daniel-bryant/includes_lookahead"
  spec.summary     = "Speeds up slow GraphQL queries that suffer from N+1 selects"
  spec.description = "Speeds up slow GraphQL queries that suffer from N+1 selects"
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/daniel-bryant/includes_lookahead"
  spec.metadata["changelog_uri"] = "https://github.com/daniel-bryant/includes_lookahead/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
end
