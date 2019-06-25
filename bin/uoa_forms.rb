#!/usr/bin/env ruby
require 'yaml'
require 'pp'
require 'yaml'

if ARGV.length != 1
  puts "We need exactly one argument"
  exit
end
fname = ARGV[0]

array = YAML.load(File.read(fname))
form_type = array["form"]

require "./lib/form#{form_type}"
form_handler(array, File.basename(fname,".yml"))
