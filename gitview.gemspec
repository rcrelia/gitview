# -*- encoding: utf-8 -*-
# Gitview Gemspec file
# Copyright 2014, Rick Crelia

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


Gem::Specification.new do |s|
  s.name        = 'gitview'
  s.version     = '0.0.5'
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ['lib']
  s.date        = '2014-12-08'
  s.summary     = 'Summary information and stats on a local git repository'
  s.description =  s.summary
  s.authors     = ['Rick Crelia']
  s.email       = ['rcrelia@gmail.com']
  s.executables = ['gitview']
  s.files       = ['lib/gitview.rb']
  s.homepage    = 'http://rubygems.org/gems/gitview'
  s.license     = 'Apache License, v2.0'

  s.add_development_dependency 'rake',  '~> 10.4'
  s.add_development_dependency 'rspec', '~> 3.1'
end
