require 'parslet'

class SimpleParser < Parslet::Parser
  root :ifthenelse
  
  rule(:ifthenelse) {
    _if >> _then >> _else.maybe
  }
  
  rule(:_if)    { str('if') >> space? >> number }
  rule(:_then)  { str('then') >> space? >> number }
  rule(:_else)  { str('else') >> space? >> number }

  rule(:number) { match["0-9"].repeat(1) >> space? }
  
  rule(:space?) { match["\s"].repeat }
end

if $0 == __FILE__
  p SimpleParser.new.parse(%Q(if 1 then 2 else 3))
end