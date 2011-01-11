
require 'treetop'

$:.unshift '.'
require 'simple'

parser = SimpleParser.new
result = parser.parse('1++2')

if !result
  puts parser.failure_reason
end