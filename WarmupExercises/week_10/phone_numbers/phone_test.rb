# We're going to use the minitest gem to run out tests. If we run `ruby phone_test.rb` from terminal, our tests will run and the results will be output in terminal
require 'minitest/autorun'
# Include the 'pride' module of minitest. Super optional, since all it does is make pretty colours in the terminal, but hey - we didn't write these tests.
require 'minitest/pride'
# Include the file where our code sits, since these tests will need the 'Phone' class we've set up in there in order to run.
require_relative './phone'

class PhoneTest < MiniTest::Test

  # Everytime you want to include a test, comment out the 'skip' line
  def test_cleans_number
    # skip
    number = Phone.new("(123) 456-7890").number
    assert_equal "1234567890", number
  end

  def test_cleans_number_with_dots
    skip
    number = Phone.new("123.456.7890").number
    assert_equal "1234567890", number
  end

  def test_valid_when_11_digits_and_first_is_1
    skip
    number = Phone.new("11234567890").number
    assert_equal "1234567890", number
  end

  def test_invalid_when_11_digits
    skip
    number = Phone.new("21234567890").number
    assert_equal "0000000000", number
  end

  def test_invalid_when_9_digits
    skip
    number = Phone.new("123456789").number
    assert_equal "0000000000", number
  end

  def test_area_code
    skip
    number = Phone.new("1234567890")
    assert_equal "123", number.area_code
  end

  def test_pretty_print
    skip
    number = Phone.new("1234567890")
    assert_equal "(123) 456-7890", number.to_s
  end

end
