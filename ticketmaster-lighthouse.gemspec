# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ticketmaster-lighthouse}
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Hong"]
  s.date = %q{2010-07-07}
  s.description = %q{Allows ticketmaster to interact with Lighthouse's issue tracking system.}
  s.email = %q{hong.quach@abigfisch.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "lib/lighthouse/LICENSE",
     "lib/lighthouse/README.markdown",
     "lib/lighthouse/lighthouse-api.rb",
     "lib/provider/comment.rb",
     "lib/provider/lighthouse.rb",
     "lib/provider/project.rb",
     "lib/provider/ticket.rb",
     "lib/ticketmaster-lighthouse.rb",
     "spec/comments_spec.rb",
     "spec/fixtures/projects.xml",
     "spec/fixtures/projects/54448.xml",
     "spec/fixtures/projects/create.xml",
     "spec/fixtures/tickets.xml",
     "spec/fixtures/tickets/2.xml",
     "spec/fixtures/tickets/5.xml",
     "spec/fixtures/tickets/create.xml",
     "spec/projects_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/ticketmaster-lighthouse_spec.rb",
     "spec/tickets_spec.rb",
     "ticketmaster-lighthouse.gemspec"
  ]
  s.homepage = %q{http://github.com/kiafaldorius/ticketmaster-lighthouse}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ticketmaster Provider for Lighthouse}
  s.test_files = [
    "spec/comments_spec.rb",
     "spec/projects_spec.rb",
     "spec/spec_helper.rb",
     "spec/ticketmaster-lighthouse_spec.rb",
     "spec/tickets_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<ticketmaster>, [">= 0.1.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_runtime_dependency(%q<activeresource>, [">= 2.3.2"])
      s.add_runtime_dependency(%q<addressable>, [">= 2.1.2"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<ticketmaster>, [">= 0.1.0"])
      s.add_dependency(%q<activesupport>, [">= 2.3.2"])
      s.add_dependency(%q<activeresource>, [">= 2.3.2"])
      s.add_dependency(%q<addressable>, [">= 2.1.2"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<ticketmaster>, [">= 0.1.0"])
    s.add_dependency(%q<activesupport>, [">= 2.3.2"])
    s.add_dependency(%q<activeresource>, [">= 2.3.2"])
    s.add_dependency(%q<addressable>, [">= 2.1.2"])
  end
end

