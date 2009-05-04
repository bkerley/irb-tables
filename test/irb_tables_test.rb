require 'test_helper'

class IrbTablesTest < Test::Unit::TestCase
  should "output an array as multiple lines" do
    assert_equal "[\n1\n2\n3\n]", [1, 2, 3].inspect
  end
  context 'with an array of activerecord objects' do
    setup do
      a = Mug.all
    end
  end
end
