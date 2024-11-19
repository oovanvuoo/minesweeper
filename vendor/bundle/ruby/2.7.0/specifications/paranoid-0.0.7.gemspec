# -*- encoding: utf-8 -*-
# stub: paranoid 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "paranoid".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Genord II".freeze]
  s.date = "2010-09-10"
  s.description = "".freeze
  s.email = "github@xspond.com".freeze
  s.extra_rdoc_files = ["README.textile".freeze]
  s.files = ["README.textile".freeze]
  s.homepage = "http://github.com/xspond/paranoid/".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Enable soft delete of ActiveRecord records. Based off defunct ActsAsParanoid and IsParanoid".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.0.0.beta"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.0.0.beta"])
  end
end
