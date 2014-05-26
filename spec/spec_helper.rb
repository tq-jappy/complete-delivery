require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS
include SpecInfra::Helper::Properties

properties = YAML.load_file('properties.yml')

RSpec.configure do |c|
  c.filter_run :force => true
  c.run_all_when_everything_filtered = true

  target_host = ENV['TARGET_HOST']

  c.host = target_host
  set_property properties[c.host]
  options = Net::SSH::Config.for(c.host, files=["vagrant-ssh.conf"])
  user    = options[:user] || Etc.getlogin
  c.ssh   = Net::SSH.start(c.host, user, options)
  c.os    = backend.check_os
end
