def solve_each(i)
  s = i.first
  s.split('').map(&:downcase).select { |c| c =~ /[a-z]/ }.group_by(&:to_s).map { |_,v| v.count }.sort { |x,y| y <=> x }.zip((1..26).to_a.reverse).inject(0) { |a, (n,e)| a + n*e }
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
