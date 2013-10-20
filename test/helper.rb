# -*- encoding: utf-8 -*-

require 'test/unit'
require 'fluent/test'
require 'fluent/plugin/in_udp_event'

unless defined?(Test::Unit::AssertionFailedError)
  class Test::Unit::AssertionFailedError < StandardError
  end
end

def unused_port
  s = TCPServer.open(0)
  port = s.addr[1]
  s.close
  port
end

def ipv6_enabled?
  require 'socket'

  begin
    TCPServer.open('::1', 0)
    true
  rescue
    false
  end
end
