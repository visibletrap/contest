def solve_each(i)
  sum = i.first.to_i
  choices = i[2].split(' ').map(&:to_i)
  dup = choices.dup
  choices.each_with_index do |c, ci|
    dup.delete_at(0)
    match = dup.index(sum - c)
    if match
      return "#{ci + 1} #{ci + 1 + match + 1}"
    end
  end
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
