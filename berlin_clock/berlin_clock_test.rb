require 'berlin_clock'
require 'test/unit'

class BerlinClockTest < Test::Unit::TestCase
  def setup
    @clock = BerlinClock.new;
  end

  # Fake test
  def test_000000
    assert_equal("Y
OOOO
OOOO
OOOOOOOOOOO
OOOO", @clock.render('00:00:00'))
  end


  def test_24000000
    assert_equal("Y
RRRR
RRRR
OOOOOOOOOOO
OOOO", @clock.render('24:00:00'))
  end
  def test_235959
    assert_equal('O
RRRR
RRRO
YYRYYRYYRYY
YYYY', @clock.render('23:59:59'))

  end

  def test_131701
    assert_equal('O
RROO
RRRO
YYROOOOOOOO
YYOO', @clock.render('13:17:01'))
  end
end