require 'test_helper'

class IrbTablesTest < Test::Unit::TestCase
  should "output an array as multiple lines" do
    assert_equal "[\n1\n2\n3\n]", [1, 2, 3].inspect
  end
  context 'with an array of activerecord objects' do
    setup do
      @mugs = Mug.all
      @out = @mugs.inspect
      @lines = @out.split("\n")
    end
    should "output a row of headers first" do
      Mug.columns.each do |c|
        assert @lines[0].include?(c.name)
      end
    end
    should "output a row of dashes next" do
      assert @lines[1] =~ /^-+$/
    end
  end
end
