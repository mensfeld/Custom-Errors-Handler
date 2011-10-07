# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{custom_errors_handler}
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Maciej Mensfeld}]
  s.date = %q{2011-10-07}
  s.description = %q{Custom Errors Handler is intended as an easy alternative to manage showing/rendering exceptions templates (404, 500) in Rails3}
  s.email = %q{maciej@mensfeld.pl}
  s.extra_rdoc_files = [%q{CHANGELOG.rdoc}, %q{README.md}, %q{lib/custom_errors_handler.rb}, %q{lib/custom_errors_handler_controller.rb}]
  s.files = [%q{CHANGELOG.rdoc}, %q{Gemfile}, %q{MIT-LICENSE}, %q{Manifest}, %q{README.md}, %q{Rakefile}, %q{init.rb}, %q{lib/custom_errors_handler.rb}, %q{lib/custom_errors_handler_controller.rb}, %q{custom_errors_handler.gemspec}]
  s.homepage = %q{https://github.com/mensfeld/Custom-Errors-Handler}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Custom_errors_handler}, %q{--main}, %q{README.md}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{custom_errors_handler}
  s.rubygems_version = %q{1.8.5}
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
