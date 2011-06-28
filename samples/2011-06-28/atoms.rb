require 'parslet'

include Parslet

def try(parser)
  puts 
  p parser
  p parser.parse('abc')
end

try str('a') >> str('b') >> str('c')
try str('a') >> str('b').as(:important) >> str('c')
try str('a') >> str('b').as(:b) >> str('c').as(:c)