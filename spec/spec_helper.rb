require 'serverspec'
require 'net/ssh'

set :backend, :ssh
 
RSpec.configure do |c|
  c.host  = ENV['TARGET_HOST']
  options = Net::SSH::Config.for(c.host)
  #options[:user] ||= Etc.getlogin

  set :host, c.host
  set :ssh_options, options
end
