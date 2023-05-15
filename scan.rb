require 'optparse'
require 'ostruct'

require_relative './lib/scanner.rb'

arguments = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-p', '--path /path/to/directory', Dir.pwd) { |o| arguments.path = o }
  opt.on('-f', '--file-ext txt', 'txt') { |o| arguments.file_ext = o }
end.parse!

scanner = Scanner.new
scanner.scan arguments.path, arguments.file_ext
