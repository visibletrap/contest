def solve_each(i)
  n,k = i.first.split(' ').map(&:to_i)
  a,b,c,r = i[1].split(' ').map(&:to_i)
  m = [a]
  (1..(k-1)).each do |ii|
    m << (b * m[ii-1] + c) % r
  end
  y = -1
  t = Hash[m.group_by { |x| x }.map { |x,z| [x, z.count] }]
  l = 0
  init = 0
  res = []
  until res.count == k+1
    (init..k).each do |nn|
      if !t.include?(nn)
        y = nn
        break
      end
    end
    res << y
    m << y

    d = m[l]
    if t[d] == 1
      t.delete(d)
    else
      t[d] -= 1
    end

    if t[y].nil?
      t[y] = 1
    else
      t[y] += 1
    end

    l += 1
    init = d < l ? d : l
    puts "===> l: #{(l).inspect}"
  end
  res[(n - 1 - k) % (k + 1)]
end

def solve(is)
  is[1..-1].each_slice((is.count - 1) / is.first.to_i).map { |i| solve_each(i) }
end

def read(i)
  File.readlines(i).map(&:strip)
end

def write(o, rs)
  write_ready = rs.zip(1..rs.length).map { |(r, i)| "Case ##{i}: #{r}" }.join("\n")
  File.write(o, write_ready)
end

def execute(i, o)
  write(o, solve(read(i)))
end

execute(*(([ARGV[0]]*2).zip([".in", ".out"]).map(&:join)))
