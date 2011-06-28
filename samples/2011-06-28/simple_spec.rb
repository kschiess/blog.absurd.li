require 'rspec'

require './simple'

describe SimpleParser do
  describe :ifthenelse do
    let(:parser) { subject.ifthenelse }

    it "should parse if-then" do
      parser.parse(%Q(if 1 then 2))
    end
    it "should parse if-then-else" do
      parser.parse(%Q(if 1 then 2 else 3))
    end
  end
end
