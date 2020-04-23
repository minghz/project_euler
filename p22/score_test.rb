require 'minitest/autorun'
require_relative './score'

class ListTest < Minitest::Test

  def test_final_total_name_score
    name_list = CSV.read('./p022_names.txt')[0]

    assert_equal 871198282, List.new(name_list).total_name_score
  end

  def test_abe_name_score
    name_list = ["ABE"]

    assert_equal 8, List.new(name_list).total_name_score
  end

  def test_smaller_total_name_score
    name_list = ["ABE", "DREW"]

    # (1+2+5) * 1 = ABE
    # (4+18+5+23) * 2 = ABE
    assert_equal 108, List.new(name_list).total_name_score
  end

end

class NameTest < Minitest::Test

  def test_name_value
    assert_equal 53, Name.new("COLIN", rand(0..100)).value
  end

  def test_name_score
    assert_equal 159, Name.new("COLIN", 3).score
  end

end
