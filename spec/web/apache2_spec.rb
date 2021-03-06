require 'spec_helper'

describe package('httpd24') do
  it { should be_installed }
end

describe service('httpd') do
  it { should_not be_enabled }
  it { should     be_running }
end

describe port(80) do
  it { should be_listening }
end
