class Roman
  def initialize(num)
    raise unless num.is_a?(Numeric)
    @x = num
    @groups = [%w[I V X], %w[X L C], %w[C D M]]
  end

  def to_s
    string = process_group(@groups[2], @x / 100)
    string << process_group(@groups[1], (@x % 100) / 10)
    string << process_group(@groups[0], @x % 10)

    return string
  end


  def last_grouping_cipher(i, group)
    last_grouping_cipher = if i > 3 then
                             i > 8 ? group[2] : group[1]
                           else
                             ''
                           end
  end


  def process_group(group, num)
    i, string = cut_tens(num, group)
    last_grouping_cipher = last_grouping_cipher(i, group)
    string = add_units(i, last_grouping_cipher, string, group[0])
  end

  def add_units(i, last_grouping_cipher, string, unit)
    if i % 5 == 4
      string << unit << last_grouping_cipher
    else
      string << last_grouping_cipher << unit * (i% 5)
    end
    return string
  end

  def cut_tens(i, group)
    string = ''
    while i > 10
      string << group[2]
      i -= 10
    end
    return i, string
  end
end