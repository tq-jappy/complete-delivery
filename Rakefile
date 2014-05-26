require 'rake'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'
require 'yaml'

properties = YAML.load_file('properties.yml')

desc "Run serverspec to all hosts"
task :serverspec => 'serverspec:all'

class ServerspecTask < RSpec::Core::RakeTask

  attr_accessor :target

  def spec_command
    cmd = super
    "env TARGET_HOST=#{target} #{cmd}"
  end
end

namespace :serverspec do
  task :all => properties.keys.map {|key| 'serverspec:' +  key}

  properties.keys.each do |key|
    desc "Run serverspec to #{key}"
    ServerspecTask.new(key.to_sym) do |t|
      t.target = key
      t.pattern = 'spec/{' + properties[key][:roles].join(',') + '}/*_spec.rb'
    end
  end
end

# RSpec::Core::RakeTask.new(:spec) do |t|
#   t.pattern = 'spec/*/*_spec.rb'
# end

# task :default => :serverspec:all
