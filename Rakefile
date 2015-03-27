require 'rake'
require 'rspec/core/rake_task'
require 'json'
 
desc "Run serverspec to all hosts"
task :spec => 'spec:all'
task :default => :spec
 
namespace :spec do
  hosts = JSON.load(File.new('hosts.json'))

  task :all     => hosts.map {|h| h['name'] }
  task :default => :all

  hosts.each do |host|
    full_name  = host['name']
    short_name = host['name'].split('.')[0]
    desc "Run serverspec to #{full_name}"
    RSpec::Core::RakeTask.new(short_name) do |t|
      ENV['TARGET_HOST'] = full_name
      t.pattern = "spec/{#{host['roles'].join(',')}}/*_spec.rb"
    end
  end
end
