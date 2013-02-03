def solve_each(i)
  s = i.first
  no = s.split('').select { |e| e =~ /:/ or e =~ /\(/ or e =~ /\)/ }.join
  puts "===> no: #{(no).inspect}"
  1
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
