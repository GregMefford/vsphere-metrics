# encoding: utf-8

require 'rbvmomi'

class Vsphere::Metrics::Collector
  DEFAULT_CONNECTION_OPTIONS = {
    :hostname => "127.0.0.1",
    :port => 443,
    :https => true,
    :insecure => false,
    :username => nil,
    :password => nil,
  }

  def self.connect(opts = {})
    if opts[:username].nil? || opts[:password].nil?
      fail "You must specify a username and password to connect"
    end
    opts = DEFAULT_CONNECTION_OPTIONS.merge opts
    connection = RbVmomi::VIM.connect(
      :host => opts[:hostname],
      :port => opts[:port],
      :ssl => opts[:https],
      :insecure => opts[:insecure],
      :user => opts[:username],
      :password => opts[:password],
    )
    collector = self.new
    collector.instance_variable_set("@connection", connection)
  end # def self.connect
end
