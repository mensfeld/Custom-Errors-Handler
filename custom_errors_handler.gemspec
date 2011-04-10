# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{custom_errors_handler}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Maciej Mensfeld"]
  s.date = %q{2011-04-10}
  s.description = %q{Custom Errors Handler is intended as an easy alternative to manage showing/rendering exceptions templates (404, 500) in Rails3}
  s.email = %q{maciej@mensfeld.pl}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.md", "lib/custom_errors_handler.rb", "lib/custom_errors_handler_controller.rb"]
  s.files = ["CHANGELOG.rdoc", "Gemfile", "MIT-LICENSE", "Manifest", "README.md", "Rakefile", "init.rb", "lib/custom_errors_handler.rb", "lib/custom_errors_handler_controller.rb", "custom_errors_handler.gemspec"]
  s.homepage = %q{https://github.com/mensfeld/custom_errors_handler}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Custom_errors_handler", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{custom_errors_handler}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Custom Errors Handler is intended as an easy alternative to manage showing/rendering exceptions templates (404, 500) in Rails3}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_development_dependency(%q<rails>, [">= 3.0.0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<rails>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<rails>, [">= 3.0.0"])
  end
end
