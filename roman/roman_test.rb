require 'roman'
require 'test/unit'

class RomanTest < Test::Unit::TestCase
  def test_instantiate
    Roman.new(1)
  end

  def test_one
    assert_equal('I', Roman.new(1).to_s)
  end

  def test_two
    assert_equal('II', Roman.new(2).to_s)
  end

  def test_three
    assert_equal('III', Roman.new(3).to_s)
  end

  def test_four
    assert_equal('IV', Roman.new(4).to_s)
  end

  def test_five
    assert_equal('V', Roman.new(5).to_s)
  end
  def test_six
    assert_equal('VI', Roman.new(6).to_s)
  end
  def test_nine
    assert_equal('IX', Roman.new(9).to_s)
  end
  def test_ten
    assert_equal('X', Roman.new(10).to_s)
  end

  def test_thirteen
    assert_equal('XIII', Roman.new(13).to_s)
  end

  def test_fourteen
    assert_equal('XIV', Roman.new(14).to_s)
  end

  def test_thirty_seven
    assert_equal('XXXVII', Roman.new(37).to_s)
  end
  def test_forty_two
    assert_equal('XLII', Roman.new(42).to_s)
  end

  def test_three_hundred_forty_two
    assert_equal('CCCXLII', Roman.new(342).to_s)
  end

  def test_thousand
    assert_equal('M', Roman.new(1000).to_s)
  end
  def test_3847
    assert_equal('MMMDCCCXLVII', Roman.new(3847).to_s)
  end

end