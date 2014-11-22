# Vsphere::Metrics

Collects performance metrics from a VMware ESXi host or vCenter Server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vsphere-metrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vsphere-stats

## Usage

This gem isn't really ready for people to use it directly yet. The goal is to
make it easy to select performance metrics to be polled from a vSphere server
(ESXi host or vCenter Server) on an interval. The initial focus is to get it
working to the point that it can be embedded in a Logstash plugin.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/vsphere-metrics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
