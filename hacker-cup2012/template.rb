def solve(raw)

end

File.open('out', 'w') do |ouf|
  File.open('in', 'r') do |inf|
    inf.gets.to_i.times do |i|
      inf.lineno = i.succ
      ouf.puts "Case ##{i.succ}: #{solve(inf.gets)}"
    end
  end
end
