require 'test/unit'
require 'rubygems'

$:.unshift(File.dirname(__FILE__) + '/../lib')

def reload
  Object.send(:remove_const, :RubyConfig) if defined? RubyConfig
  load 'lib/ruby-config.rb'
end