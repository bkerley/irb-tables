require 'test_helper'

class IrbTablesTest < Test::Unit::TestCase
  should "output an array as multiple lines" do
    assert_equal "[\n1\n2\n3\n]", [1, 2, 3].inspect
  end
end
