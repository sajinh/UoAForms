#!/usr/bin/env ruby
require 'yaml'
require 'pp'

if ARGV.length != 1
  puts "We need exactly one argument"
  exit
end
fname = ARGV[0]

array = YAML.load(File.read(fname))
form_type = array["form"]

#require "./lib/form#{form_type}"
require 'erb'
require File.join(File.expand_path(File.dirname(__FILE__)),"../lib/uoa_forms_module")
require File.join(File.expand_path(File.dirname(__FILE__)),"../lib/form#{form_type}")
form_handler(form_type, array, File.basename(fname,".yml"))
