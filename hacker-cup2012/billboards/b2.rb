# [[1, 2, 3], [1,2]]

def font_by_w(lines, w)
  w / lines.max
end

def font_by_h(lines, h)
  h / lines.size
end

def line_w(line)
  (line.dup << line.size - 1).inject(:+)
end

def make(is, base_w, l)
  line_limit = (base_w - (l - 1)) / l
  res = []
  p "lm #{line_limit}"
  is.each do |i|
    if res.last.nil? or (res.last+i) > line_limit
      res << i
    else
      tmp = res.dup
      tmp.delete_at(res.size - 1)
      p tmp
      tmp << (res.last + i + 1)
      res = tmp
    end
    p "res #{res.inspect}"
  end
  res
end

def op(line)
  w, h, *words = line.split(' ')
  w, h, is = w.to_i, h.to_i, words.map(&:length)
  max = 0
  (1..[is.size,h].min).each do |l|
    base_w = line_w(is)
    x = make(is, base_w, l)
    p ">>>>>>>> #{x.inspect}"
    max = [max, [font_by_w(x, w), font_by_h(x, h)].min].max
  end
  max
end

p op('10 20 MUST BE ABLE TO HACK')

# File.open('out', 'w') do |ouf|
  # File.open('in', 'r') do |inf|
    # inf.gets
    # i = 1
    # while line = inf.gets
      # ouf.puts "Case ##{i}: #{op(line)}"
      # i += 1
    # end
  # end
# end
