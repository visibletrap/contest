def solve(raw)
  raw = raw.split(' ').map(&:to_i)
  a = (raw[0]..raw[1]).to_a
  r = 0

  until a.empty?
    b = a.first
    f = [a.delete(b)]

    c = b.to_s.split('')

    (c.length - 1).times do
      d = c.shift
      e = (c << d).flatten.join('').to_i
      if a.include?(e)
        f << a.delete(e)
      end
    end
    r += f.combination(2).count
  end

  r
end

File.open('C-large.out', 'w') do |ouf|
  File.open('C-large.in', 'r') do |inf|
    inf.gets.to_i.times do |i|
      inf.lineno = i.succ
      ouf.puts "Case ##{i.succ}: #{solve(inf.gets)}"
    end
  end
end