class BerlinClock
  def render(string)
    hour, minutes, seconds = string.split(':').map!(&:to_i)
    render_second_row(seconds) <<
    render_hour_rows(hour) <<
    render_minute_rows(minutes)

  end

  def render_second_row(seconds)
    (seconds % 2 == 0 ? 'Y' : 'O') << "\n"
  end

  def render_minute_rows(minutes)
    fourth_row, fifth_row = minutes / 5, minutes % 5
    string = ('Y' * fourth_row << 'O' * (11 - fourth_row) << "\n").gsub('YYY', 'YYR')
    string << 'Y' * fifth_row << 'O' * (4 - fifth_row)
    return string
  end

  def render_hour_rows(hour)
    second_row, third_row = hour / 5, hour % 5
    string = 'R' * second_row << 'O' * (4 - second_row) << "\n"
    string << 'R' * third_row << 'O' * (4 - third_row) << "\n"
    return string
  end
end