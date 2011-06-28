require 'parslet'

class SimpleParser < Parslet::Parser
  root :ifthenelse
  
  rule(:ifthenelse) {
    _if >> _then >> _else.maybe
  }
  
  rule(:_if)    { str('if') >> space? >> number.as(:cond) }
  rule(:_then)  { str('then') >> space? >> number.as(:then) }
  rule(:_else)  { str('else') >> space? >> number.as(:else) }

  rule(:number) { match["0-9"].repeat(1).as(:number) >> space? }
  
  rule(:space?) { match["\s"].repeat }
end

class SimpleTransform < Parslet::Transform
  rule(:number => simple(:n)) { Integer(n) }

  rule(
    :cond => simple(:c), 
    :then => simple(:t), 
    :else => simple(:e)) { [c, t, e] }
  rule(
    :cond => simple(:c), 
    :then => simple(:t)) { [c, t, nil] }
end

if $0 == __FILE__
  p SimpleParser.new.number.parse('123')
  p SimpleTransform.new.apply(SimpleParser.new.parse(%Q(if 1 then 2 else 3)))
  p SimpleTransform.new.apply(SimpleParser.new.parse(%Q(if 1 then 2)))
end