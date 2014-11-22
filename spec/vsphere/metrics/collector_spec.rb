# encoding: utf-8

require "spec_helper"

include Vsphere::Metrics

describe 'Vsphere::Metrics::Collector' do
  Given(:options) {
    {
      :hostname => hostname,
      :username => username,
      :password => password,
      # Skip certificate validation in testing. What could go wrong? ;)
      :insecure => true,
    }
  }
  # NOTE: If VCR doesn't already have a cassette for the test you're running,
  # you'll have to create a 'metrics' user with the password set to 'password'
  # and give it appropriate permissions to read performance metrics in the
  # vSphere environment.
  Given(:username) { 'metrics' }
  Given(:password) { 'password' }

  context 'Connecting to an ESXi 5.5 host' do
    # NOTE: If VCR doesn't already have a cassette for the test you're running,
    # you'll need to have a HOSTS file entry or DNS record to point the hostname
    # 'esxi-5-5' to a VMware host running ESXi 5.5.
    Given(:hostname) { 'esxi-5-5' }

    describe 'Vsphere::Metrics::Collector.connect' do
      context 'Fails to connect if no password is provided' do
        Given(:password) { nil }
        Then{ expect{ Collector.connect(options) }.to raise_error }
      end
      context 'Fails to connect if no username is provided' do
        Given(:username) { nil }
        Then{ expect{ Collector.connect(options) }.to raise_error }
      end
      context 'Succeeds with valid credentials', :vcr do
        Then{ expect{ Collector.connect(options) }.to_not raise_error }
      end
    end # Vsphere::Metrics::Collector.connect

    describe 'Vsphere::Metrics::Collector.counters', :vcr do
      Given(:collector){ Collector.connect(options) }
      Then{ expect(collector.counters).to include('cpu.usage.average') }
    end # Vsphere::Metrics::Collector.counters

  end # Connecting to an ESXi 5.5 host

end # Vsphere::Metrics::Collector
