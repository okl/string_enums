# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "string_enums".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2.0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Todd Kummer".freeze]
  s.date = "2017-08-17"
  s.description = "== StringEnum is a concern that makes it easy to work with enums. Include the module, then invoke
the class method string_enum with the attribute name followed by the list of valid values. This will
add checks, writers, and constants for each value.".freeze
  s.email = "engrteam@onekingslane.com".freeze
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.homepage = "http://github.com/okl/string_enums".freeze
  s.licenses = ["BSD 3-clause".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Allows using string enums in ActiveRecord models instead of integers".freeze

  s.specification_version = 4
  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
end

