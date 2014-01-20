require_relative '../lib/task1'

describe Array do

  let (:list) {[3,4,2]}

  context '.implant should replicate .inject'do
    
    it 'and should take an argument and a block of code' do
      expect(list.implant(0) {|sum, n| sum + n}).to eq(9)
    end

  end

end