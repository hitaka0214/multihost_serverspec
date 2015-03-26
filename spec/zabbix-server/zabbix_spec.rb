require 'spec_helper'

describe package('zabbix-server') do
  it { should be_installed }
end

describe service('zabbix-server') do
  it { should be_enabled }
  it { should be_running }
end

describe port(10051) do
  it { should be_listening }
end
