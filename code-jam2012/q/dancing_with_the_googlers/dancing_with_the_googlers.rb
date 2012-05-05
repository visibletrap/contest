def solve(raw)
  is = raw.split(' ').map(&:to_i)
  ns = is[3, is[0]].sort.reverse

  surprises = ns.select do |n|
    (n <= 28) && (n != 0) && (n % 3 != 1)
  end.select do |n|
    x = if n % 3 == 0
          n/3
        else
          n/3 + 1
        end
    x < is[2]
  end.take(is[1])

  surprises.each { |s| ns.delete_at(ns.find_index(s)) }

  ns = ns.map do |n|
    if n > 28
      10
    elsif n == 0
      0
    elsif n % 3 == 0
      n/3
    else
      n/3 + 1
    end
  end

  ss = surprises.map { |n| n/3 + (n % 3 == 0 ? 1 : 2) }

  (ns + ss).select{ |n| n >= is[2] }.count
end

File.open('B-large.out', 'w') do |ouf|
  File.open('B-large.in', 'r') do |inf|
    inf.gets.to_i.times do |i|
      inf.lineno = i.succ
      ouf.puts "Case ##{i.succ}: #{solve(inf.gets)}"
    end
  end
end